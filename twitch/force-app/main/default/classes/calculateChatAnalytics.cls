public without sharing class CalculateChatAnalytics {
    Chat chat = null;
    User mostFrequentChatter = null;
    Stream_Stats__c analytics = new Stream_Stats__c();

    public CalculateChatAnalytics(Chat chatToAnalyze) {
        Chat chat = chatToAnalyze;
        this.analytics.OwnerId = chat.getChatOwner().Id;
    }


    public void calculateAllStats() {
        this.mostFrequentChatter();
        this.emoteUsageAnalytics();
        upsert analytics;
    }

    public void mostFrequentChatter() {
        Map<User, Integer> chatters = new Map<User, Integer>();
        for(ChatMessage message: chat.getMessages()) {
            User sender = message.getSender();
            if(chatters.containsKey(sender)) {
                chatters.put(sender, chatters.get(sender) + 1);
            } else {
                chatters.put(sender, 1);
            }
        }
        for(User allChatters: chatters.keySet()) {
            // Every chat is initialized with one message from a null user, so the first
            // iteration of get(this.mostFrequent) will always return 1
            if(chatters.get(allChatters) >= chatters.get(mostFrequentChatter)) {
                mostFrequentChatter = allChatters;
            }
        }
        this.analytics.Most_Frequent_Chatter__c = mostFrequentChatter;
    }

    public void emoteUsageAnalytics() {
        Map<String, Integer> emotesUsed = new Map<String, Integer>();
        // Twitch emotes are delimited by :
        // Technically this could be more restrictive (emote prefixes must start with a lowercase letter)
        Pattern emoteRegex = Pattern.compile(':.*:');

        for(ChatMessage message: chat.getMessages()) {
            String messageText = message.getMessage();
            Matcher emoteMatcher = emoteRegex.matcher(messageText);
            // Loops through each message finding each instance of an emote
            while(emoteMatcher.find()) {
                String emoteUsed = messageText.substring(emoteMatcher.start(), emoteMatcher.end());
                if(emotesUsed.containsKey(emoteUsed)) {
                    emotesUsed.put(emoteUsed, emotesUsed.get(emoteUsed)+1);
                } else {
                    emotesUsed.put(emoteUsed, 1);
                }
            }
        }

        // Wraps the map into a list that is sorted by usage count
        List<EmoteStatsWrapper> emoteList = new EmoteStatsWrapper[0];
        for(String emote: emotesUsed.keyset()) {
            emoteList.add(new EmoteStatsWrapper(emote, emotesUsed.get(emote)));
        }
        emoteList.sort();
        Integer numberOfEmotes = emoteList.size();

        if(numberOfEmotes > 0) {
            this.analytics.Most_Used_Emote_1__c = emoteList[numberOfEmotes-1].emote;
            this.analytics.Most_Used_Emote_1_Usage__c = emoteList[numberOfEmotes-1].count;
        } if (numberOfEmotes > 1) {
            this.analytics.Most_Used_Emote_2__c = emoteList[numberOfEmotes-2].emote;
            this.analytics.Most_Used_Emote_2_Usage__c = emoteList[numberOfEmotes-2].count;
        } if (numberOfEmotes > 2) {
            this.analytics.Most_Used_Emote_3__c = emoteList[numberOfEmotes-3].emote;
            this.analytics.Most_Used_Emote_3_Usage__c = emoteList[numberOfEmotes-3].count;
        }

    }



}