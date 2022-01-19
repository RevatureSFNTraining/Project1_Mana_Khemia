public without sharing class ChatMessage {
    public ChatMessage(User messageSender, Datetime messageTimestamp, String messageMessage) {
        if(message.length() > 500) {
            throw new MessageTooLongException('Message exceeds maximum length of 500 characters.');
        } else {
            User sender = messageSender;
            Datetime timestamp = messageTimestamp;
            String message = messageMessage;
        }
    }

    public virtual class MessageTooLongException extends Exception {}

    public User getSender() {
        return sender;
    }
    public Datetime getTimestamp() {
        return timestamp;
    }
    public String getMessage() {
        return message;
    }
    public void deleteMessage() {
        this.message = 'message deleted';
    }
}