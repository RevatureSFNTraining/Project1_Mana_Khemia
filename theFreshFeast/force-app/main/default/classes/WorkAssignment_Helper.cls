public with sharing class WorkAssignment_Helper {
    public static void myMethod(List<WorkOrder> work){
        Chef__c chef = [SELECT id FROM Chef__c where name = 'chef' Limit 1];
        
        for(WorkOrder wo : work){
            if(wo.Subject != null) {
            wo.Chef__c = chef.id;
        }
    }
}
}
