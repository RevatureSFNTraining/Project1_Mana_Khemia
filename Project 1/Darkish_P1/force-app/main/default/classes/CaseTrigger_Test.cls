@isTest
public with sharing class CaseTrigger_Test {
    @isTest
    public static void positiveArt(){
        Case newCase = new Case(Origin='Web', Status='New', Current_Poll__c='More Art Based Designs');
        
        Test.startTest();
        Database.SaveResult sr = Database.insert(newCase, false);
        Test.stopTest();
        
        System.assert(sr.isSuccess());
    }
    
    @isTest
    public static void positiveArtPolls(){
        Poll__c newPoll = new Poll__c(Name='New Monthly Poll ' + date.today().month());
        newPoll.Total_Votes__c = 10;
        newPoll.Poll_Art_Percent__c = 30;
        newPoll.Poll_Image_Percent__c = 40;
        newPoll.Poll_Logo_Percent__c = 30;
        newPoll.Creation_Date__c = date.today();
        
        insert newPoll;
        
        Case newCase = new Case(Origin='Web', Status='New', Current_Poll__c='More Art Based Designs');
        
        Test.startTest();
        Database.SaveResult sr = Database.insert(newCase, false);
        Test.stopTest();
        
        System.assert(sr.isSuccess());
    }
}