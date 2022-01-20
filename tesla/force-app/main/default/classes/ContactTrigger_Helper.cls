public with sharing class ContactTrigger_Helper {
  public static void createNewAccount(List<Contact> contactList) {
    // Create list of contacts without accounts
    List<Contact> withoutAccounts = new List<Contact>();
    for (Contact c : contactList) {
      if (contactList.AccountId == "Customer") {
        withoutAccounts.add(c);
      }
    }
    // Create new accounts for each contact and then insert the accounts 
    if (withoutAccounts.size() > 0) {
      List<Account> newAccounts = new List<Account>();
      Map<String,Contact> contactNameMap = new Map<String,Contact>();
      for (Contact c : withoutAccounts) {
          String accountName = c.firstname + ' ' + c.lastname;
          contactNameMap.put(accountName,c);
          Account a = new Account();
          a.name = accountName;
          newAccounts.add(a);
      }
      insert newAccounts;
    }
  }
}
