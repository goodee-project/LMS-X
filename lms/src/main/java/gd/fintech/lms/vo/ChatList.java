package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class ChatList {
	private int chatNo;
	private String chatroomUuid;
	private String chatSendId;
	private String chatSendName;
	private String chatReceiveId;
	private String chatReceiveName;
	private String chatText;
	private String chatSenddate;
}
