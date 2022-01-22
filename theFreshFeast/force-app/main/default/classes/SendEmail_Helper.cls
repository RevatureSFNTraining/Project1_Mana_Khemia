public with sharing class SendEmail_Helper {
   
        public static void myMethod(List<Chef__c> chef){

            List<Messaging.Email> emailList = new List<Messaging.Email>();

            for(Chef__c c : chef){
                //List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
                Messaging.singleEmailmessage mails = new Messaging.SingleEmailmessage();

                List<String> sendTo = new List<String>();
                sendTo.add(c.Chef_Email__c);

                /*mails.sendToAddresses(new string[] {c.Chef_Email__c});
                mails.setSubject('Record deleted successfully');
                String body = 'Dear chef, your Account is deleted successfully';
                mails.setHtmlbody(body);
                emailList.add(deletechef);   */
                      
             }
        Messaging.sendEmail(emailList); 
    }
}
