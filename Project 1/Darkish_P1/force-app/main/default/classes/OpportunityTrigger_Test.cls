@isTest
public class OpportunityTrigger_Test {
    @testSetup
    public static void testMockData(){
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Oppotunity';
        opp.Requested_Design_Type__c = '';
        opp.CloseDate = System.today().addMonths(1);
        
        Database.insert(opp);
    }
    
    @isTest
    public static void positiveTest(){
        Opportunity opp = [SELECT Name, Requested_Design_Type__c FROM Opportunity LIMIT 1];
        opp.Requested_Design_Type__c = 'Art Based Sets';
        
        Database.SaveResult sr = Database.update(opp, false);
        
        system.assert(sr.isSuccess());
    }
}