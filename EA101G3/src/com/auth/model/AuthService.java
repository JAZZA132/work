package com.auth.model;

import java.util.Set;



public class AuthService {
	
	private AuthDAO_interface dao;

	public AuthService() {
		dao = new AuthDAO();
	}

	public AuthVO addAuth(String empID,String bgFuncNo) {

		AuthVO authVO = new AuthVO();

		authVO.setEmpID(empID);
		authVO.setBgFuncNo(bgFuncNo);
		dao.insert(authVO);

		return authVO;
	}

	

	public void deleteAuth(String empID, String bgFuncNo) {
		dao.deleteAuth(empID,bgFuncNo);
	}



	public Set<AuthVO> getAll(String empID) {
		return dao.getAuthsByEmp(empID);
	}

}
