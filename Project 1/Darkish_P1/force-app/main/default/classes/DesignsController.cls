public without sharing class DesignsController {


    static List<Map<String, String>> desingFields = new List<Map<String, String>>(); 
    @AuraEnabled(cacheable=true)
    public  static List<Design__c> getDesigns() {

        return [ 
            SELECT Id, Name, Completed__c, Completed_Date__c, Design_Type__c
            FROM Design__c
            WHERE Completed__c = TRUE
            ORDER BY Name
        ];
    }
}