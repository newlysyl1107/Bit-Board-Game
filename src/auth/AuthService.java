package auth;

import java.util.List;

import dto.TableDto;
import reservation.TableDao;

public class AuthService {
	public AuthService() {

	}
	public List<TableDto> getAllTableList() {
		TableDao tDao = new TableDao();
		
		return tDao.getAllTableList(); 
	}
}
