public class AccountTrigger_Helper {

    
    public static void checkOpenOpportunities(List<Account> accountList) {
        List<Opportunity> oppList = [SELECT id,AccountId,StageName,IsClosed,Close_Reason__c FROM Opportunity WHERE AccountId in :accountList];
        for(Opportunity opp: oppList) {
            if(opp.IsClosed == false) {
                for(Account acc: accountList) {
                    if(acc.Id == opp.AccountId) {
                        acc.addError('Cannot delete account with open Opportunities.');
                    }
                }
            }
        }
    }
    
    
    public static void addDummyContact(List<Account> accountList) {
        List<Contact> contactList = [SELECT id,AccountId FROM Contact WHERE AccountId in :accountList];
        List<Contact> newContacts = new List<Contact>();
        for(Account acc: accountList) {
            for(Contact con: contactList) {
                if(acc.Id == con.Id) {
                    break;
                } else {
                    newContacts.add(new Contact(FirstName = acc.Name, AccountId = acc.Id, Phone = acc.Phone));
                }
            }
        }
        
        Database.SaveResult[] srList = Database.update(newContacts, false);
        for(Database.SaveResult sr: srList) {
        	if (sr.isSuccess()) {
        	System.debug('Successfully added dummy contact info. Contact ID: ' + sr.getId());
    		} else {              
                for(Database.Error err : sr.getErrors()) {
            		System.debug('The following error has occurred.');                    
            		System.debug(err.getStatusCode() + ': ' + err.getMessage());
            		System.debug('Contact fields that affected this error: ' + err.getFields());
        		}
    		}
        }
    }
}