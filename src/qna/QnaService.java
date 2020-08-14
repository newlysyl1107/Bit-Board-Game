package qna;

import java.util.List;

import dto.QnaCommentDto;
import dto.QnaDto;

public class QnaService {

	// 리스트 호출(검색, 페이징 전)
	public List<QnaDto> getQnaList() {
		QnaDao dao = QnaDao.getInstance();
		List<QnaDto> list = dao.getQnaList();
		
		return list;
	}
	// 관리자 작성글(공지사항 호출)
	public List<QnaDto> getQnaNoticeList() {
		QnaDao dao = QnaDao.getInstance();
		List<QnaDto> getQnaNoticeList = dao.getQnaNoticeList();
		
		return getQnaNoticeList;
	}
	
	// 리스트 호출(검색, 페이징 포함)
	public List<QnaDto> getQnaPagingList(String choice, String searchWord, int pageNumber) {
		QnaDao dao = QnaDao.getInstance();
		List<QnaDto> list = dao.getQnaPagingList(choice, searchWord, pageNumber);
		
		return list;
	}

	public boolean setQnaWrite(QnaDto dto) {
		QnaDao dao = QnaDao.getInstance();
		boolean isS = dao.setQnaWrite(dto);
		
		return isS;
	}

	public QnaDto getQnaDetail(int seq) {
		QnaDao dao = QnaDao.getInstance();
		QnaDto dto = dao.getQnaDetail(seq);
		
		return dto;
	}

	public boolean setQnaUpdate(int seq, String title, String content, int is_secret) {
		QnaDao dao = QnaDao.getInstance();
		boolean isS = dao.setQnaUpdate(seq, title, content, is_secret);
		
		return isS;
	}

	public boolean setQnaDelete(int seq) {
		QnaDao dao = QnaDao.getInstance();
		boolean isS = dao.setQnaDelete(seq);
		return isS;
	}

	public List<QnaDto> getQnaSearchList(String choice, String searchWord) {
		QnaDao dao = QnaDao.getInstance();
		List<QnaDto> list = dao.getQnaSearchList(choice, searchWord);
		
		return list;
	}
	
	public int getQnaListCount(String choice, String searchWord) {
		QnaDao dao = QnaDao.getInstance();
		int allCount = dao.getQnaListCount(choice, searchWord);
		
		return allCount;
	}

	public void getReadCount(int seq) {
		QnaDao dao = QnaDao.getInstance();
		dao.getReadCount(seq);
	}

	public boolean setQnaComment(QnaCommentDto qnaCommentDto) {
		QnaDao dao = QnaDao.getInstance();
		boolean isS = dao.setQnaComment(qnaCommentDto);
		
		return isS;
	}

	public List<QnaCommentDto> getComment(int seq) {
		QnaDao dao = QnaDao.getInstance();
		List<QnaCommentDto> commList= dao.getComment(seq);
		return commList;
	}

	public boolean setQnaAnswerEnd(int seq) {
		QnaDao dao = QnaDao.getInstance();
		boolean isS = dao.setQnaAnswerEnd(seq);
		return isS;
	}

	public boolean setQnaAnswerWait(int seq) {
		QnaDao dao = QnaDao.getInstance();
		boolean isS = dao.setQnaAnswerWait(seq);
		return isS;
	}


	public List<QnaDto> getNoAnsList(int pageNum) {
		QnaDao dao = QnaDao.getInstance();
		return dao.getNoAnsList(pageNum);
	}
	
	public int getNoAnsCount() {
		QnaDao dao = QnaDao.getInstance();
		return dao.getNoAnsCount();
	}
	
}
