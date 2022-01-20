public with sharing class ContactTrigger_Helper {
        
    // add default account to new contact if no account is specified
    public static void defaultAccount(List<Contact> cons) {
        List<Account> accsToInsert = new List<Account>();
        Map<String, Contact> conNameKeys = new Map<String, Contact>();

        for (Contact con : cons) {
            if (con.AccountId == null) {
                String accName = '';
                if (!String.isBlank(con.FirstName)) {
                    accName += con.FirstName + ' ';
                }
                accName += con.LastName;
                conNameKeys.put(accName, con);
                 
                Account acc = new Account();
                acc.Name = accName;
                accsToInsert.add(acc);
            }
        }

        // inserting the new accounts into database
        if (!accsToInsert.isEmpty()) {
            insert accsToInsert;
        }

        // associating account to contact
        for (Account acc : accsToInsert) {
            if (conNameKeys.containsKey(acc.Name)) {
                conNameKeys.get(acc.Name).accountId = acc.Id;
            }
        }
    }
}