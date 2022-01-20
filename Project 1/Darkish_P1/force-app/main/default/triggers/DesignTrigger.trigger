trigger DesignTrigger on Design__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            
        } 
        when BEFORE_UPDATE {
            DesignTrigger_Helper.updateOnCompleted(Trigger.new);
        }
        when BEFORE_DELETE {

        }
        when AFTER_INSERT {

        }
        when AFTER_UPDATE {

        }
        when AFTER_DELETE {

        }
        when AFTER_UNDELETE {

        } 
    }
}