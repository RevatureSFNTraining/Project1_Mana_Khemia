public with sharing class ProductTrigger_Helper {

    // create an inventory for new products
    public static void createInventory(List<Product2> prods) {
            List<Inventory__c> inventoriesToInsert = new List<Inventory__c>();

            Schema.Location FantasticTools = [SELECT Id, Name FROM Location WHERE Name = 'Fantastic Tools' LIMIT 1];

            for (Product2 prod : prods) {
                    Inventory__c inventory = new Inventory__c();
                    inventory.Product__c = prod.Id;
                    inventory.Location__c = FantasticTools.Id;
                    inventory.Quantity__c = 0;
                    inventoriesToInsert.add(inventory);
            }
    
            // inserting the new inventories into database
            if (!inventoriesToInsert.isEmpty()) {
                insert inventoriesToInsert;
            }
        }
}