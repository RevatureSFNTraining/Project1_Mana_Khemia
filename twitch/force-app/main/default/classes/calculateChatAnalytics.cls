public without sharing class CalculateChatAnalytics {
    public CalculateChatAnalytics(Chat chatToAnalyze) {
        Chat chat = chatToAnalyze;
    }



    public void calculateAllStats() {

    }

    @future
    public User mostFrequentChatter() {
        User mostFrequent = null;
        Map<User, Integer> chatters = new Map<User, Integer>();
        for(ChatMessage message: chat.getMessages()) {
            User sender = message.getSender();
            if(chatters.containsKey(sender) == false) {
                chatters.put(sender, 1);
            } else {
                chatters.put(sender, chatters.get(sender) + 1);
            }
        }
        for(User allChatters: chatters.keySet()) {
            // Every chat is initialized with one message from a null user, so the first
            // iteration of get(this.mostFrequent) will always return 1
            if(chatters.get(allChatters) >= chatters.get(mostFrequent)) {
                mostFrequent = allChatters;
            }
        }

        return mostFrequent;
    }

    @future
    public Map<String, Integer> emoteUsageAnalytics() {
        Map<String, Integer> usedEmotes = new Map<String, Integer>();
        Pattern emoteRegex = Pattern.compile(':.*:');
        for(ChatMessage message: chat.getMessages()) {
            String messageText = message.getMessage();
            Matcher emoteMatcher = emoteRegex.matcher(messageText);
            while(emoteMatcher.find()) {
                String emoteUsed = messageText.substring(emoteMatcher.start(), emoteMatcher.end());
                usedEmotes.put(emoteUsed, usedEmotes.get(emoteUsed)+1);
            }
        }
        return usedEmotes;
    }


}