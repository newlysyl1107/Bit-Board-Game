
package admin;

import java.util.List;

import dto.TableDto;
import reservation.TableDao;

public class AdminTableService {
	public AdminTableService() {

	}
	public List<TableDto> getAllTableList() {
		TableDao tDao = new TableDao();
	
		
		return tDao.getAllTableList(); 
	}
	
	public List<TableDto> getAbleDelTableList() {
		TableDao tDao = new TableDao();
		
		return tDao.getAbleDelTableList();
	}
	
	public List<TableDto> getNoDelTableList() {
		TableDao tDao = new TableDao();
		
		return tDao.getNoDelTableList();
	}
	
	public boolean tableDel(int tableNum) {
		TableDao tDao = new TableDao();
		
		return tDao.tableDel(tableNum);
		
	}
}
