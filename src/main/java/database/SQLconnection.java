package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.dumbleBean;

public class SQLconnection {
	static Connection conn = null;
	static PreparedStatement stmt = null;
	static ResultSet rs = null;	
	
	public static boolean connectSQL() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception ex) {
			System.out.println("Exception driver " + ex.getMessage());
			return false;
		}
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dumbledb", DatabaseLogin.getuName(), DatabaseLogin.getuPass());
			return true;
			
		} catch(SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return false;
		}		
	}
	public static ArrayList<dumbleBean> stateSQL(String scpName, String ikeaName, String bearName, ArrayList<dumbleBean> rows) {

		String requestQuery = "SELECT `SCP`, `Title`, `rating`, `Classification`, `Type`, `Related_GOI_s`, `Location_Notes`, `Author`, `Leaked_info`, `Humanoid_or_Structure`, `Animal_Computer_or_Extradimensional`, `Autonomous_or_Cognitohazard`, `Artifact_Location_or_Sentient`, `Summary`, `Gender`, `None`, `Ethnicity_Origins` FROM `masterscplist` WHERE CONCAT_WS(`SCP`, `Title`, `rating`, `Classification`, `Type`, `Related_GOI_s`, `Location_Notes`, `Author`, `Leaked_info`, `Humanoid_or_Structure`, `Animal_Computer_or_Extradimensional`, `Autonomous_or_Cognitohazard`, `Artifact_Location_or_Sentient`, `Summary`, `Gender`, `None`, `Ethnicity_Origins`) LIKE ?"
							+ "UNION ALL SELECT `name`, `description`, `Column_3`, `Column_4`, `Column_5`, Null as Col6, Null as Col7, Null as Col8, Null as Col9, Null as Col10, Null as Col11, Null as Col12, Null as Col13, Null as Col14, Null as Col15, Null as Col16, Null as Col17 FROM `ikea_names` WHERE CONCAT_WS(`name`, `description`, `Column_3`, `Column_4`, `Column_5`) LIKE ?"
							+ "UNION ALL SELECT `Character`, `Origin`, `Creator`, `Notes`, Null as Col5, Null as Col6, Null as Col7, Null as Col8, Null as Col9, Null as Col10, Null as Col11, Null as Col12, Null as Col13, Null as Col14, Null as Col15, Null as Col16, Null as Col17 FROM `bearbase` WHERE CONCAT_WS(`Character`, `Origin`, `Creator`, `Notes`) LIKE ?";
		
		try {
			stmt = conn.prepareStatement(requestQuery);
			
			stmt.setString(1, "%" + scpName + "%");
			stmt.setString(2, "%" + ikeaName + "%");
			stmt.setString(3, "%" + bearName + "%");
			
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				dumbleBean row = new dumbleBean();
				
				row.setCol1(rs.getString("SCP"));
				row.setCol2(rs.getString("Title"));
				row.setCol3(rs.getString("rating"));
				row.setCol4(rs.getString("Classification"));
				row.setCol5(rs.getString("Type"));
				row.setCol6(rs.getString("Related_GOI_s"));
				row.setCol7(rs.getString("Location_Notes"));
				row.setCol8(rs.getString("Author"));
				row.setCol9(rs.getString("Leaked_info"));
				row.setCol10(rs.getString("Humanoid_or_Structure"));
				row.setCol11(rs.getString("Animal_Computer_or_Extradimensional"));
				row.setCol12(rs.getString("Autonomous_or_Cognitohazard"));
				row.setCol13(rs.getString("Artifact_Location_or_Sentient"));
				row.setCol14(rs.getString("Summary"));
				row.setCol15(rs.getString("Gender"));
				row.setCol16(rs.getString("None"));
				row.setCol17(rs.getString("Ethnicity_Origins"));
				
				rows.add(row);
			}
			rs.close();
			
			conn.endRequest();
			conn.close();
			
			return rows;
			
		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		return null;
	}
}
