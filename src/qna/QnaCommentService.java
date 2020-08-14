package qna;

import java.util.List;

import dto.QnaCommentDto;
import dto.QnaDto;

public class QnaCommentService {

	public boolean setCommDelete(int commSeq) {
		QnaCommentDao commDao = QnaCommentDao.getInstance();
		boolean isS = commDao.setCommDelete(commSeq);
		
		return isS;
	}
	
	
}
