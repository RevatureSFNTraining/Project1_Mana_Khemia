trigger OpportunityTrigger on Opportunity (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            
        } 
        when BEFORE_UPDATE {
        }
        when BEFORE_DELETE {

        }
        when AFTER_INSERT {

        }
        when AFTER_UPDATE {
            OpportunityTrigger_Helper.sendDesignEmail(Trigger.new);
        }
        when AFTER_DELETE {

        }
        when AFTER_UNDELETE {

        } 
	}
}