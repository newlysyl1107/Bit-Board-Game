package admin;

import java.util.List;

import dto.TableDto;
import reservation.TableDao;

public class AdminService {
	public AdminService() {

	}
	public List<TableDto> getAllTableList() {
		TableDao tDao = new TableDao();
		
		return tDao.getAllTableList(); 
	}
}
