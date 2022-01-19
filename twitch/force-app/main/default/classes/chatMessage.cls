public class ChatMessage {
    User sender = null;
    Datetime timestamp = null;
    String message = null;

    public ChatMessage(User messageSender, Datetime messageTimestamp, String messageMessage) {
        if(message.length() > 500) {
            throw new MessageTooLongException('Message exceeds maximum length of 500 characters.');
        } else {
            this.sender = messageSender;
            this.timestamp = messageTimestamp;
            this.message = messageMessage;
        }
    }

    public virtual class MessageTooLongException extends Exception {}

    public User getSender() {
        return this.sender;
    }
    public Datetime getTimestamp() {
        return this.timestamp;
    }
    public String getMessage() {
        return this.message;
    }
    public void deleteMessage() {
        this.message = 'message deleted';
    }
}