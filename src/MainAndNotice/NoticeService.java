package MainAndNotice;

import java.util.List;

import dto.NoticeDto;

public class NoticeService {
	
	NoticeDAO dao = NoticeDAO.getInstance();
	
	// 공지 작성
	public boolean writeNotice(NoticeDto dto) {
		return dao.writeNotice(dto);
	}
	
	// 공지 수정
	public boolean updateNotice(String title, String content, int seq) {
		return dao.updateNotice(title, content, seq);
	}
	
	// 공지 삭제
	public boolean deleteNotice(int seq) {
		return dao.deleteNotice(seq);
	}
	
//	// �˻��� ����Ʈ�� ��������
//	public List<NoticeDto> getNoticeList(String choice, String searchWord) {
//		return dao.getNoticeList(choice, searchWord);
//	}
	
	// 검색결과 개수
	public int getSearchCount(String choice, String searchWord) {
		return dao.getSearchCount(choice, searchWord);
	}
	
	// 조회수
	public void viewCount(int seq) {
		
	}
	
	// 상세조회
	public NoticeDto noticeDetail(int seq) {
		return dao.noticeDetail(seq);
	}
	
	// 전체 글 개수
	public int getAllcount() {
		return dao.getAllcount();
	}
	
	
	// 페이징 글 개수
	public List<NoticeDto> getSearchAllList(String choice, String searchWord, int pageNumber) {
		return dao.getSearchAllList(choice, searchWord, pageNumber);
	}
	
	
	// 검색 상관없이 모든 글 전부 다 불러오기 (단, 삭제한 글 del = 1 은 제외하고)
	public List<NoticeDto> showAllNotice(int pageNumber) {
		return dao.showAllNotice(pageNumber);
	}

	
	// 이전글
	public NoticeDto preNotice(int seq) {
		return dao.preNotice(seq);
	}
	
	// 다음글
	public NoticeDto postNotice(int seq) {
		return dao.postNotice(seq);
	}


}
