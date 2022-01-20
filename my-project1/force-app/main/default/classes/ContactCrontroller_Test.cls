@isTest
public with sharing class ContactCrontroller_Test {
    @TestSetup
    static void makeData(){
        List<Contact> conList = new List<Contact>();
        for (Integer i = 0; i < 20; i++){
            Contact con = new Contact(LastName=String.valueOf(i));
            conList.add(con);
        }
        insert conList;
    }

    @isTest
    public static void positiveTestCase() {
        List<Contact> cons = ContactController.getContactList();
        system.assert(!cons.isEmpty());
    }
}