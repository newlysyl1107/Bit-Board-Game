package admin;

import java.util.List;

import dto.TableDto;
import reservation.TableDao;

public class AdminTableUpdateService {
	public AdminTableUpdateService() {

	}
	public boolean AdminTableUpdateAlter(String[] stnValues , String[] spnValues , String[] sisRev , String[] soriginalPk) {
		
		System.out.println("AdminTableUpdateService 서비스로 넘어와서 테스트 하는용도.");
		System.out.println("=====================");
		System.out.println(stnValues.length);
		System.out.println(spnValues.length);
		System.out.println(sisRev.length);
		System.out.println(soriginalPk.length);
		System.out.println("=====================");
		
		int[] tnValues = new int[stnValues.length];
		int[] pnValues = new int[spnValues.length];
		int[] isRev = new int[sisRev.length];
		
		int[] originalPk = new int[soriginalPk.length];
		
		for(int i = 0; i < stnValues.length; i++) {
			tnValues[i] = Integer.parseInt(stnValues[i]);
			pnValues[i] = Integer.parseInt(spnValues[i]);
			isRev[i] = Integer.parseInt(sisRev[i]);
		}
		for(int i = 0; i < soriginalPk.length; i++) {
			originalPk[i] = Integer.parseInt(soriginalPk[i]);
		}
		
		TableDao dao = new TableDao();	
		Boolean isS = dao.AdminTableUpdate(tnValues, pnValues, isRev, originalPk);

		return isS;
	}
}
