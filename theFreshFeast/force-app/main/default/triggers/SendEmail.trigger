trigger SendEmail on Chef__c (after insert) {
    SendEmail_Helper.myMethod(Trigger.new);
}