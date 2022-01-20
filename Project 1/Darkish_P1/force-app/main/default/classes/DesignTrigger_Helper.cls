public with sharing class DesignTrigger_Helper {
    public DesignTrigger_Helper(){
        //
    }

    public static void updateOnCompleted(List<Design__c> newDesigns){
        for(Design__c d: newDesigns){
            if(d.Completed__c){
                d.Completed_Date__c = System.today();
                d.Design_Type__c = decideDesign(d); 
            }
        }
    }


    private static string decideDesign(Design__c designs){
        string designType;
        boolean containsArt = false;
        boolean containsImg = false;
        boolean containsLogo = false;

        boolean isMixed = false;

        /*
            Design Types are Art, Image, Logo, Custom, Basic
        */
        string[] tmpString = designs.Items_Included__c.split(';');

        for(string s: tmpString){
            if(s.toLowercase().contains('art')) {containsArt = true;}
            else if(s.toLowercase().contains('img')) {containsImg = true;}
            else if(s.toLowercase().contains('logo')) {containsLogo = true;}
        }

        if(containsArt && containsImg || containsArt && containsLogo || containsLogo && containsImg) {isMixed = false;}

        if(isMixed){designType = 'Custom';}
        else if(containsArt){designType = 'Art';}
        else if(containsImg){designType = 'Image';}
        else if(containsLogo){designType = 'Logo';}
        else {designType = 'Basic';}


        return designType;
    }
}