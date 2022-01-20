@isTest
public with sharing class DesignTrigger_Test {
    @TestSetup
    static void makeData(){
        List<Design__c> testDesigns = new List<Design__c>();

        testDesigns.add(new Design__c(Name = 'Completed', Completed__c = false, Items_Included__c = 'T-shirt Large Back Logo;Hoodie Large Back Logo'));
        testDesigns.add(new Design__c(Name = 'CompletedMixed', Completed__c = false, Items_Included__c = 'T-shirt Large Back Logo;Long-Sleeve simple front Art'));
        testDesigns.add(new Design__c(Name = 'CompletedMixed', Completed__c = false, Items_Included__c = 'T-shirt;Beanie'));
        testDesigns.add(new Design__c(Name = 'notCompleted', Completed__c = false));
        Database.insert(testDesigns, false);
    }

    @isTest
    public static void positiveTestCase(){
        List<Design__c> testDesigns = [SELECT Name, Completed__c, Items_Included__c, Design_Type__c FROM Design__c];

        testDesigns[0].Completed__c = true;
        testDesigns[1].Completed__c = true;
        testDesigns[2].Completed__c = true;

        List<Database.saveResult> srList = Database.update(testDesigns, false);
        Integer failCounter = 0;
        for(Database.SaveResult sr : srList) {
            if(!sr.isSuccess()) {
                failCounter += 1;
            }
        }

        system.assertEquals(4, failCounter);
    }
}