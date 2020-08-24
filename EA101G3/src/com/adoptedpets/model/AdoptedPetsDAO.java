package com.adoptedpets.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_AdoptedPets;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;

public class AdoptedPetsDAO implements AdoptedPetsDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO ADOPTEDPETS (PETNO, ADOPTERNO, SHELTERNO, PETBREED, ADOPTEDDATE, PETPIC, ADOPTDATE, INTERVIEWDATE, INTERVIEWINFO, PETSPECIES, PETGENDER, ADOPTSTATUS)"
			+ " VALUES ('APET'||LPAD(to_char(ADOPTEDPETS_SEQ.NEXTVAL), 4, '0'),?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE = "UPDATE ADOPTEDPETS SET ADOPTERNO = ?, SHELTERNO = ?, PETBREED = ?, ADOPTEDDATE = ?, PETPIC = ?, ADOPTDATE = ?, INTERVIEWDATE = ?, INTERVIEWINFO = ?, PETSPECIES = ?, PETGENDER = ?, ADOPTSTATUS = ?  WHERE PETNO = ?";
	private static final String DELETE = "DELETE FROM ADOPTEDPETS WHERE PETNO = ?";
	private static final String GET_ALL_STMT = "SELECT PETNO, ADOPTERNO, SHELTERNO, PETBREED, ADOPTEDDATE, PETPIC, ADOPTDATE, INTERVIEWDATE, INTERVIEWINFO, PETSPECIES, PETGENDER, ADOPTSTATUS FROM ADOPTEDPETS ORDER BY PETNO ASC";
	private static final String GET_ONE_STMT = "SELECT PETNO, ADOPTERNO, SHELTERNO, PETBREED, ADOPTEDDATE, PETPIC, ADOPTDATE, INTERVIEWDATE, INTERVIEWINFO, PETSPECIES, PETGENDER, ADOPTSTATUS FROM ADOPTEDPETS WHERE PETNO = ?";

	@Override
	public void insert(AdoptedPetsVO adoptedpetsVO) {


		Connection con = null;
		PreparedStatement pstmt = null;

		try {

//			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, adoptedpetsVO.getAdopterNo());
			pstmt.setString(2, adoptedpetsVO.getShelterNo());
			pstmt.setString(3, adoptedpetsVO.getPetBreed());
			pstmt.setDate(4, adoptedpetsVO.getAdoptedDate());
			pstmt.setBytes(5, adoptedpetsVO.getPetPic());
			pstmt.setDate(6, adoptedpetsVO.getAdoptDate());
			pstmt.setDate(7, adoptedpetsVO.getInterviewDate());
			pstmt.setString(8, adoptedpetsVO.getInterviewInfo());
			pstmt.setString(9, adoptedpetsVO.getPetSpecies());
			pstmt.setString(10, adoptedpetsVO.getPetGender());
			pstmt.setInt(11, adoptedpetsVO.getAdoptStatus());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(AdoptedPetsVO adoptedpetsVO) {



		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, adoptedpetsVO.getAdopterNo());
			pstmt.setString(2, adoptedpetsVO.getShelterNo());
			pstmt.setString(3, adoptedpetsVO.getPetBreed());

			if (adoptedpetsVO.getAdoptedDate() != null) {
				pstmt.setDate(4, adoptedpetsVO.getAdoptedDate());
			} else {
				pstmt.setNull(4, java.sql.Types.DATE);
			}

			pstmt.setBytes(5, adoptedpetsVO.getPetPic());

			if (adoptedpetsVO.getAdoptDate() != null) {
				pstmt.setDate(6, adoptedpetsVO.getAdoptDate());
			} else {
				pstmt.setNull(6, java.sql.Types.DATE);
			}

			if (adoptedpetsVO.getInterviewDate() != null) {
				pstmt.setDate(7, adoptedpetsVO.getInterviewDate());
			} else {
				pstmt.setNull(7, java.sql.Types.DATE);
			}

			pstmt.setString(8, adoptedpetsVO.getInterviewInfo());
			pstmt.setString(9, adoptedpetsVO.getPetSpecies());
			pstmt.setString(10, adoptedpetsVO.getPetGender());
			pstmt.setInt(11, adoptedpetsVO.getAdoptStatus());
			pstmt.setString(12, adoptedpetsVO.getPetNo());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(String petNo) {



		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, petNo);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public AdoptedPetsVO findByPrimaryKey(String petNo) {

		AdoptedPetsVO adoptedpetsVO = null;
		ResultSet rs = null;


		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();

			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, petNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// adoptedpetsVO 也稱為 Domain objects
				adoptedpetsVO = new AdoptedPetsVO();

				adoptedpetsVO.setPetNo(rs.getString("PETNO"));
				adoptedpetsVO.setAdopterNo(rs.getString("ADOPTERNO"));
				adoptedpetsVO.setShelterNo(rs.getString("SHELTERNO"));
				adoptedpetsVO.setPetBreed(rs.getString("PETBREED"));
				adoptedpetsVO.setAdoptedDate(rs.getDate("ADOPTEDDATE"));
				adoptedpetsVO.setPetPic(rs.getBytes("PETPIC"));
				adoptedpetsVO.setAdoptDate(rs.getDate("ADOPTDATE"));
				adoptedpetsVO.setInterviewDate(rs.getDate("INTERVIEWDATE"));
				adoptedpetsVO.setInterviewInfo(rs.getString("INTERVIEWINFO"));
				adoptedpetsVO.setPetSpecies(rs.getString("PETSPECIES"));
				adoptedpetsVO.setPetGender(rs.getString("PETGENDER"));
				adoptedpetsVO.setAdoptStatus(rs.getInt("ADOPTSTATUS"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return adoptedpetsVO;
	}

	@Override
	public List<AdoptedPetsVO> getAll() {

		List<AdoptedPetsVO> list = new ArrayList<AdoptedPetsVO>();
		AdoptedPetsVO adoptedpetsVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// adoptedpetsVO 也稱為 Domain objects
				adoptedpetsVO = new AdoptedPetsVO();

				adoptedpetsVO.setPetNo(rs.getString("PETNO"));
				adoptedpetsVO.setAdopterNo(rs.getString("ADOPTERNO"));
				adoptedpetsVO.setShelterNo(rs.getString("SHELTERNO"));
				adoptedpetsVO.setPetBreed(rs.getString("PETBREED"));
				adoptedpetsVO.setAdoptedDate(rs.getDate("ADOPTEDDATE"));
				adoptedpetsVO.setPetPic(rs.getBytes("PETPIC"));
				adoptedpetsVO.setAdoptDate(rs.getDate("ADOPTDATE"));
				adoptedpetsVO.setInterviewDate(rs.getDate("INTERVIEWDATE"));
				adoptedpetsVO.setInterviewInfo(rs.getString("INTERVIEWINFO"));
				adoptedpetsVO.setPetSpecies(rs.getString("PETSPECIES"));
				adoptedpetsVO.setPetGender(rs.getString("PETGENDER"));
				adoptedpetsVO.setAdoptStatus(rs.getInt("ADOPTSTATUS"));
				list.add(adoptedpetsVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<AdoptedPetsVO> getAll(Map<String, String[]> map) {
		List<AdoptedPetsVO> list = new ArrayList<AdoptedPetsVO>();
		AdoptedPetsVO adoptedpetsVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			String finalSQL = "SELECT * FROM ADOPTEDPETS  "
					+ jdbcUtil_CompositeQuery_AdoptedPets.get_WhereCondition(map) + "ORDER BY PETNO ASC";
			pstmt = con.prepareStatement(finalSQL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adoptedpetsVO = new AdoptedPetsVO();
				adoptedpetsVO.setPetNo(rs.getString("PETNO"));
				adoptedpetsVO.setAdopterNo(rs.getString("ADOPTERNO"));
				adoptedpetsVO.setShelterNo(rs.getString("SHELTERNO"));
				adoptedpetsVO.setPetBreed(rs.getString("PETBREED"));
				adoptedpetsVO.setAdoptedDate(rs.getDate("ADOPTEDDATE"));
				adoptedpetsVO.setPetPic(rs.getBytes("PETPIC"));
				adoptedpetsVO.setAdoptDate(rs.getDate("ADOPTDATE"));
				adoptedpetsVO.setInterviewDate(rs.getDate("INTERVIEWDATE"));
				adoptedpetsVO.setInterviewInfo(rs.getString("INTERVIEWINFO"));
				adoptedpetsVO.setPetSpecies(rs.getString("PETSPECIES"));
				adoptedpetsVO.setPetGender(rs.getString("PETGENDER"));
				adoptedpetsVO.setAdoptStatus(rs.getInt("ADOPTSTATUS"));
				list.add(adoptedpetsVO); // Store the row in the List
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
}

