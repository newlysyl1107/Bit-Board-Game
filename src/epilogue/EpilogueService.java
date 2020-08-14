package epilogue;

import java.util.List;

import dto.EpilogueDto;

public class EpilogueService {

	EpilogueDao dao = EpilogueDao.getInstance();
	
	public boolean writeEpilogue(EpilogueDto epilogue) {
		return dao.writeEpilogue(epilogue);
	}
	
	/*
	public List<EpilogueDto> getEpilogueList() {
		return dao.getEpilogueList();
	}
	*/
	
	public EpilogueDto getEpilogue(int seq) {
		return dao.getEpilogue(seq);
	}
	
	public boolean epilogueReply(int seq, EpilogueDto epilogue) {
		return dao.epilogueReply(seq, epilogue);
	}
	
	public boolean updateEpilogue(int seq, String title, String content) {
		return dao.updateEpilogue(seq, title, content);		
	}
	
	public boolean deleteEpilogue(int seq) {
		return dao.deleteEpilogue(seq);		
	}
	
	/*
	public List<EpilogueDto> getEpilogueList(String choice, String searchWord){
		return dao.getEpilogueList(choice, searchWord);		
	}
	*/
	
	public int getAllEpilogue(String choice, String searchWord) {
		return dao.getAllEpilogue(choice, searchWord);	
	}
	public List<EpilogueDto> getEpiloguePagingList(String choice, String searchWord, int page){
		return dao.getEpiloguePagingList(choice, searchWord, page);	
	}
	
	public List<EpilogueDto> getEpilogueReplies(int seq) {
		return dao.getEpilogueReplies(seq);	
	}
	
	public int getReplyCount(int ref) {
		return dao.getReplyCount(ref);	
	}
}
