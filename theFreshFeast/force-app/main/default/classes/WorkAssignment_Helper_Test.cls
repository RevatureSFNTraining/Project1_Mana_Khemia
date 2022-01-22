@isTest
public with sharing class WorkAssignment_Helper_Test {

        @isTest
        public static void positiveTestCase() {
            WorkOrder wo = new WorkOrder(Subject = 'Make some Fish');
            Database.saveResult sr = Database.insert(wo, false);
    
            system.assert(sr.isSuccess());
    
    }

    @TestSetup
    static void makeData(){
        Chef__c chef = new Chef__c(name = 'chef', Chef_Contact__c = '2562544858');
        insert chef;
    }
    @isTest
    public static void bulkPositiveTestCase() {
        Integer expected = 0;
        List<WorkOrder> wo = new List<WorkOrder>();
        Chef__c chef = [SELECT id FROM Chef__c where name = 'chef' Limit 1];

        for(Integer i = 0; i < expected; i++) {
            WorkOrder w = new WorkOrder(Subject = 'Chicken');
            wo.add(w);
        }

        List<Database.saveResult> srList = Database.insert(wo, false);
        Integer failCounter = 0;
        for(Database.SaveResult sr : srList) {
            if(!sr.isSuccess()) {
                failCounter += 1;
            }
        }

        List<WorkOrder> createdWorkOrders = [SELECT id, Chef__c FROM WorkOrder WHERE Subject='Chicken' LIMIT :expected];
        for (WorkOrder w : createdWorkOrders) {
            if (w.Chef__c != chef.id) {
                failCounter++;
            }
        }

        system.assertEquals(expected, failCounter);
    }
}
