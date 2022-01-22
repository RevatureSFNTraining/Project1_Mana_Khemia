
public with sharing class DataSendController {

            @AuraEnabled(cacheable=true)
            public static List<Restaurant__c> getAccounts() {
                return [
                    SELECT Contact__c, Restaurant_address__c
                    FROM Restaurant__c 
                ];
            }
        }
    

