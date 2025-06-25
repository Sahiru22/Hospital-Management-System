package com.patient;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import database.DBConnect;

public class patientDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean registerPatient(String name,String username,String password) {
		
		boolean isSuccess = false;
		
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//------------------------------------------------------------------------------------------------------
			
			String sql = "insert into patient values(0,'"+name+"','"+username+"','"+password+"') ";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;
						
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static List<Patient> validate(String userName, String password) {
		
		ArrayList<Patient> patient = new ArrayList<>();

		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from patient where username = '"+ userName +"' and password = '"+ password +"'";
			rs = stmt.executeQuery(sql);
						
			while(rs.next()) {
				int id = rs.getInt("idpatient");
				String name = rs.getString("pname");
				String usernameP = rs.getString("username");
				String passP = rs.getString("password");
				System.out.println(id);
				Patient p = new Patient(id,name,usernameP,passP);
				patient.add(p);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return patient;
	}
	
	public static boolean validate1(String userName, String password) {
		
		boolean isSuccess = false;

		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from patient where username = '"+ userName +"' and password = '"+ password +"'";
			rs = stmt.executeQuery(sql);
						
			if(rs.next()) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	

}
