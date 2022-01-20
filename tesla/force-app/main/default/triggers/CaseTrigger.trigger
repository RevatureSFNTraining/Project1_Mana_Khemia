trigger CaseTrigger on Case (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
  Switch on Trigger.OperationType {
    when BEFORE_INSERT {
      CaseTrigger_Helper.createCase(Trigger.new);
    }
    when BEFORE_UPDATE {}
    when BEFORE_DELETE {}
    when AFTER_INSERT {}
    when AFTER_UPDATE {}
    when AFTER_DELETE {}
    when AFTER_UNDELETE {} 
  }
}