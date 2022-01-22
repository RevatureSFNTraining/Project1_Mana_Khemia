public with sharing class ChefTrigger_Helper {

        public static void myMethod(List<Chef__c> chefList){

            for(Chef__c c : chefList) {
                if(c.Chef_Contact__c == null) {
                    c.Chef_Contact__c.addError('Chef must have a phone number!');
                }
            }
        }
    }

