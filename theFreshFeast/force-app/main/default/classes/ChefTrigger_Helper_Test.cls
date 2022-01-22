@isTest
public class ChefTrigger_Helper_Test {

    @isTest
    public static void negativeTestCase() {
        Chef__c c = new Chef__c(Name = 'Kia');
        Database.saveResult sr = Database.insert(c, false);

        system.assert(!sr.isSuccess());
    }

    @isTest
    public static void bulkNegativeTestCase() {
        Integer expected = 10;
        List<Chef__c> cList = new List<Chef__c>();
        for(Integer i = 0; i < expected; i++) {
            Chef__c c = new Chef__c(Name = 'Kia');
            cList.add(c);
        }

        List<Database.saveResult> srList = Database.insert(cList, false);
        Integer failCounter = 0;
        for(Database.SaveResult sr : srList) {
            if(!sr.isSuccess()) {
                failCounter += 1;
            }
        }

        system.assertEquals(expected, failCounter);
    }
}