@isTest
public with sharing class ContactTrigger_Helper_Test {
    @isTest
    public static void singlePositiveTestCase() {
        Contact con = new Contact(firstName = 'Theo', lastName = 'Smith');
        insert con;

        String accName = '';
        if (!String.isBlank(con.FirstName)) {
            accName += con.FirstName + ' ';
        }
        accName += con.LastName;

        Contact createdCon = [SELECT Id, Name, Account.Name FROM Contact WHERE FirstName = :con.FirstName AND LastName = :con.LastName LIMIT 1];

        system.assert(createdCon.Account.Name == accName);
    }

    @isTest
    public static void bulkPositiveTestCase() {
        List<Contact> conList = new List<Contact>();
        List<String> accNames = new List<String>();

        Integer NUMBER_CONTACTS = 100;

        for (Integer i = 0; i < NUMBER_CONTACTS; i++) {
            Contact con = new Contact(firstName = 'test', lastName = String.valueOf(i));
            conList.add(con);
            
            String accName = '';
            if (!String.isBlank(con.FirstName)) {
                accName += con.FirstName + ' ';
            }
            accName += con.LastName;

            accNames.add(accName);

        }
        insert conList;

        List<Contact> createdCons = [SELECT Id, Name, Account.Name FROM Contact WHERE FirstName = 'test' LIMIT :NUMBER_CONTACTS];

        Boolean result = true;
        for (Integer i = 0; i < NUMBER_CONTACTS; i++) {
            if (createdCons[i].Account.Name != accNames[i]) {
                result = false;
            }
        }
        system.assert(result);
    }

    @isTest
    public static void negativeTestCase() {
        Contact con = new Contact(firstName = 'John');
        Database.saveResult sr = Database.insert(con, false);

        system.assert(!sr.isSuccess());
    }
}