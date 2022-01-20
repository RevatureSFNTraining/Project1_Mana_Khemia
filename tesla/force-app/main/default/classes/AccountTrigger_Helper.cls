public with sharing class AccountTrigger_Helper {
  public static void updateAccountPhone(List<Account> accountList) {
    for (Account a : accountList) {
      if (a.Phone == null) {
        a.Phone.addError('Phone number is required.') 
      }
    }
  }
}