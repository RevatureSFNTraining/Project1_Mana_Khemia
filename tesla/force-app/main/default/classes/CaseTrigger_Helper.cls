public with sharing class CaseTrigger_Helper {
  public static void createCase(List<Case> caseList) {
    for (Case c : caseList) {
      if (c.Subject == null) {
        c.Subject.addError('A case subject is required.') 
      }
    }
  }
}
