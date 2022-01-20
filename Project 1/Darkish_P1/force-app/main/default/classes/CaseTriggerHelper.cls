public with sharing class CaseTriggerHelper {
    public CaseTriggerHelper() {

    }

    public static void managePolls(List<Case> cases){
        integer increaseArt = 0;
        integer increaseImg = 0;
        integer increaseLogo = 0;

        for(Case c: cases){
            if(c.Origin == 'Web' && (c.Current_Poll__c != '' || c.Current_Poll__c != null)){
        
                if(c.Current_Poll__c.contains('Art')){increaseArt += 1;}
                else if(c.Current_Poll__c.contains('Image')){increaseImg += 1;}
                else if(c.Current_Poll__c.contains('Logo')){increaseLogo += 1;}
            }
        }
        List<Poll__c> polls = [SELECT Creation_Date__c, Poll_Art_Percent__c, Poll_Image_Percent__c, Poll_Logo_Percent__c, Total_Votes__c 
            FROM Poll__c];



        Decimal oldArt = 0;
        Decimal oldImg = 0;
        Decimal oldLogo = 0;
        
        if(polls.size() >= 1){
            for(Poll__c p: polls){
                if(p.Creation_Date__c.month() == date.today().month()){
                    system.debug(p.Poll_Art_Percent__c);
                    system.debug(p.Poll_Image_Percent__c);
                    system.debug(p.Poll_Logo_Percent__c);
                    
                    decimal tempArt = p.Total_Votes__c * (p.Poll_Art_Percent__c / 100) ;
                    decimal tempLogo = p.Total_Votes__c * (p.Poll_Logo_Percent__c / 100);
                    decimal tempImg = p.Total_Votes__c * (p.Poll_Image_Percent__c / 100);
                    
                    System.debug(tempArt);
                    System.debug(tempImg);
                    System.debug(tempLogo);
                    
                    p.Total_Votes__c += increaseLogo + increaseImg + increaseArt;
                                                           
                    p.Poll_Art_Percent__c = (tempArt + increaseArt) / p.Total_Votes__c;
                    p.Poll_Image_Percent__c = (tempImg + increaseImg) / p.Total_Votes__c;
                    p.Poll_Logo_Percent__c = (tempLogo + increaseLogo) / p.Total_Votes__c;
    
                    
                    
                    system.debug(p.Poll_Art_Percent__c);
                    system.debug(p.Poll_Image_Percent__c);
                    system.debug(p.Poll_Logo_Percent__c);
                    system.debug(p.Poll_Art_Percent__c + p.Poll_Image_Percent__c + p.Poll_Logo_Percent__c);
                }
            }
        } else{
            Poll__c newPoll = new Poll__c(Name='New Monthly Poll ' + date.today().month());
            newPoll.Total_Votes__c = increaseLogo + increaseImg + increaseArt;
            newPoll.Poll_Art_Percent__c = (increaseArt / newPoll.Total_Votes__c) * 100;
            newPoll.Poll_Image_Percent__c = (increaseImg / newPoll.Total_Votes__c) * 100;
            newPoll.Poll_Logo_Percent__c = (increaseLogo / newPoll.Total_Votes__c) * 100;
            newPoll.Creation_Date__c = date.today();

            polls.add(newPoll);
        }

        upsert polls;
    }
}