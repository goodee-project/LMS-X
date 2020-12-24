package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class Note {
	private int 	noteNo;					// 쪽지 no
	private String 	noteTitle;				// 쪽지 제목
	private String 	noteContent;			// 쪽지 내용
	private String 	noteDispatcherId;		// 쪽지 발신자 id
	private String 	noteDispatcherName;		// 쪽지 발신자 name
	private String 	noteReceiverId;			// 쪽지 수신자 id
	private String 	noteReceiverName;		// 쪽지 수신자 name
	private String 	noteSendDate;			// 쪽지 발신 날짜
	private String	noteIsRead;				// 쪽지를 수신자가 읽었는지
	private String 	noteDelete;				// 쪽지 삭제 상태 : NULL = 미삭제, dispatcher = 발신자쪽만 삭제, receiver = 수신자쪽만 삭제
}
