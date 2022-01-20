@isTest
public with sharing class AccountController_Test {
    @TestSetup
    static void makeData(){
        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 20; i++){
            Account acc = new Account(Name=String.valueOf(i));
            accList.add(acc);
        }
        insert accList;
    }

    @isTest
    public static void positiveTestCase() {
        List<Account> accs = AccountController.getAccountList();
        system.assert(!accs.isEmpty());
    }
}