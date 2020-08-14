package reservation;

import java.util.List;

import dto.ReservationDto;
import dto.TableDto;

public class ReservationService {
	RevDao rDao = new RevDao();

	public ReservationService() {

	}	
	
	public List<TableDto> getReservationTableList() {
		TableDao tDao = new TableDao();
		
		return tDao.getReservationTableList(); 
	}
	public List<ReservationDto> getMyReserv(String id, int page){
		
		
		return rDao.getMyReserv(id, page);
		
	}
	
	public int getAllReserv(String id) {
		
		return rDao.getAllreserv(id);
	}
	
	public boolean revDel(int seq) {
		return rDao.revDel(seq);
	}
	
	public List<ReservationDto> getAllCurRev() {
		return rDao.getAllCurRev();
	}
	
	public int tableCount() {
		TableDao tDao = new TableDao();
		return tDao.tableCount();
	}
	
	public int revMonthCount(String date) {
		return rDao.revMonthCount(date);
	}
}
