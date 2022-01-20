@isTest
public with sharing class ProductTrigger_Helper_Test {
    @TestSetup
    static void makeData(){
        Schema.Location FantasticTools = new Schema.Location(Name='Fantastic Tools', LocationType = 'Warehouse');
        insert FantasticTools;
    }

    @isTest
    public static void singlePositiveTestCase() {
        Product2 prod = new Product2(Name = 'test', Approval_Status__c = 'Draft');
        insert prod;

        // Product2 createdProd = [SELECT Id, Name FROM Product2 LIMIT 1];
        Inventory__c inventory = [SELECT Id, Name, Product__c FROM Inventory__c LIMIT 1];

        system.assert(inventory != null);
    }

    @isTest
    public static void bulkPositiveTestCase() {
        List<Product2> prodList = new List<Product2>();

        Integer NUMBER_PRODUCTS = 100;

        for (Integer i = 0; i < NUMBER_PRODUCTS; i++) {
            Product2 prod = new Product2(Name = String.valueOf(i));
            prodList.add(prod);
        }
        insert prodList;

        List<Inventory__c> inventories = [SELECT Id, Name, Product__c FROM Inventory__c LIMIT :NUMBER_PRODUCTS];

        Boolean result = true;
        for (Integer i = 0; i < NUMBER_PRODUCTS; i++) {
            if (inventories[i].Product__c != prodList[i].Id) {
                result = false;
            }
        }
        system.assert(result);
    }

    @isTest
    public static void negativeTestCase() {
        Product2 prod = new Product2();
        Database.saveResult sr = Database.insert(prod, false);

        system.assert(!sr.isSuccess());
    }
}