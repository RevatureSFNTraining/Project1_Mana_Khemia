public class OpportunityTrigger_Helper {
    
    public static void sendDesignEmail(List<Opportunity> Opps){
        
        list<Messaging.SingleEmailMessage> mailList = new list<Messaging.SingleEmailMessage>();
        EmailTemplate et=[Select id from EmailTemplate where name = 'New Design Request' limit 1];
       	User user = [SELECT Id, SenderEmail FROM User WHERE UserRoleId = '00E5f000000Q9Sj'];
        for(Opportunity o: Opps){
            if(o.Requested_Design_Type__c != '' || o.Requested_Design_Type__c != null){            
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTargetObjectId(user.Id);
 				mail.setSenderDisplayName('Opportunity Team');
 				mail.setTemplateId(et.id);
                mailList.add(mail);
            }
        }
        
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList);
        }
    }
}