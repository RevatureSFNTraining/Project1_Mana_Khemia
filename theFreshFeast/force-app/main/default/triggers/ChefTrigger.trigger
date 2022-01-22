trigger ChefTrigger on Chef__c (before insert) {
    
     ChefTrigger_Helper.myMethod(Trigger.new);
    }
