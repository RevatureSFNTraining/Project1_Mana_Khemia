public without sharing class Stream_Stats_Trigger_Helper {
    public void verifyStreamer(List<Stream_Stats__c> statsList) {
        List<User> associatedUsers = [SELECT Id, Name FROM User WHERE OwnerId in :statsList];
        for(Stream_Stats__c stats: statsList) {
            if(stats.Total_Hours_Streamed__c < 20) {
                stats.addError('Analytics are only available to account with at least 20 hours of total stream time.');
            }
            if(!associatedUsers.contains(stats.OwnerId)) {
                stats.addError('Stats not associated with a user correctly.');
            }
        }
    }
}
