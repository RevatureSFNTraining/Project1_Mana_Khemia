public with sharing class Chat {
    List<ChatMessage> chatMessages = new List<ChatMessage>();
    User chatOwner = null;

    public Chat(User owner) {
        this.chatOwner = owner;
        chatMessages.add(new ChatMessage(null, System.now(), 'Chat initialized.'));
    }

    public virtual class MessageDoesNotExistException extends Exception {}
    public virtual class UserIsBannedException extends Exception {}


    public User getChatOwner() {
        return chatOwner;
    }

    public List<ChatMessage> getMessages() {
        return chatMessages;
    }

    public void appendNewMessage(ChatMessage messageInfo) {
        chatMessages.add(messageInfo);
    }

    public void deleteMessage(ChatMessage messageInfo) {
        Integer messageLocation = chatMessages.indexOf(messageInfo);
        if(messageLocation != -1) {
            messageInfo.deleteMessage();
            chatMessages.set(messageLocation, messageInfo);
        } else {
            throw new MessageDoesNotExistException('Message to delete does not exist.');
        }
    }

    
}