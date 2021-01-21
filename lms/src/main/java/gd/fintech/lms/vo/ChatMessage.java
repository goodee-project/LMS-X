package gd.fintech.lms.vo;


import lombok.Data;

@Data
public class ChatMessage {
    private String chatRoomId;
    private String writerId;
    private String writerName;
    private String message;
    private String chatDate;
    private MessageType type;
}
