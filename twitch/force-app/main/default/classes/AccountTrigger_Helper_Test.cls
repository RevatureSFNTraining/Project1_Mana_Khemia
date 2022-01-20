@isTest
public class AccountTrigger_Helper_Test {
    

    
    @isTest
    public static void noAssociatedContactTest() {
        List<Account> noContactAccounts = new List<Account>();
        for(Integer i = 0; i < 20; i++) {
            noContactAccounts.add(new Account(Name = 'Ihavenocontact', Phone='555-555-5555'));
        }
        Integer expected = 20;

        List<Database.saveResult> srList = Database.insert(noContactAccounts, false);
        
        List<Account> addedAccounts = [SELECT id,Name,Phone FROM Account];
        List<Contact> addedContacts = [SELECT id,Name,Phone FROM Contact];
        
        Integer successCounter = 0;
        for(Account acc: addedAccounts) {
            for(Contact con: addedContacts) {
                if(acc.Name == con.FirstName && acc.Phone == con.Phone) {
                    successCounter+=1;
                }
            }
        }
        
        system.assertEquals(expected, successCounter);
    }
    
}