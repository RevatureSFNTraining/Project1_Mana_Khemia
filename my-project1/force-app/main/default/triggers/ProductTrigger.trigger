trigger ProductTrigger on Product2 (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    Switch on Trigger.OperationType {
        when BEFORE_INSERT {

        }
        when BEFORE_UPDATE {

        }
        when BEFORE_DELETE {

        }
        when AFTER_INSERT {
            // create an inventory for new products
            ProductTrigger_Helper.createInventory(Trigger.new);
        }
        when AFTER_UPDATE {
            
        }
        when AFTER_DELETE {

        }
        when AFTER_UNDELETE {

        } 
    }
}
