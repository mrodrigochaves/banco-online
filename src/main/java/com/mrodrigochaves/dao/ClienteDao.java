package com.mrodrigochaves.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mrodrigochaves.bean.Cliente;

public class ClienteDao {
    
    public static Connection getConnection(){
        Connection conn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_bank","admin","abcd1234");
        } catch(Exception e){
            System.out.println(e);
        }
        return conn;
    }
    
    public static Cliente getValidateLogin(String login, String password) {
    	Cliente client = null;
    	
    	try {
    		Connection conn = getConnection();
    		PreparedStatement ps = (PreparedStatement) conn.prepareStatement("SELECT * FROM client WHERE login = ? AND password = ?");
    		ps.setString(1, login);
    		ps.setString(2, password);
    		ResultSet rs = ps.executeQuery();
    		
    		 while(rs.next()) {
                 rs.getString("login");
                 rs.getString("password");
    			
    		}
    	}catch(Exception e) {
    		System.out.println(e);
    	}
    	return client;
    }
    
    public static int deleteClient(Cliente c) {
    	int status = 0;
    	
    	try {
    		Connection conn = getConnection();
    		PreparedStatement ps = (PreparedStatement) conn.prepareStatement("DELETE * FROM client WHERE id=?");
    		ps.setInt(1, c.getId());
    		status = ps.executeUpdate();
    	}catch(Exception e) {
    		System.out.println(e);
    	}
		return status;
    }
    
    public static int saveClient(Cliente c) {
    	int status = 0;
    	
    	try {
    		Connection conn = getConnection();
    		PreparedStatement ps = (PreparedStatement) conn.prepareStatement("INSERT INTO client (name, login, password) VALUES (?,?,?)");
    		ps.setString(1, c.getName());
    		ps.setString(2, c.getLogin());
    		ps.setString(3, c.getPassword());
    		status = ps.executeUpdate();
    	}catch(Exception e) {
    		System.out.println(e);
    	}
    	return status;
    }

    public static Cliente getRegisterById(int id) {
    	Cliente client = null;  
    	
    	try {
    		Connection conn = getConnection();
    		PreparedStatement ps = (PreparedStatement) conn.prepareStatement("SELECT * FROM client WHERE id=?");
    		ps.setInt(1, id);
    		ResultSet rs = ps.executeQuery();
    		
    		 while(rs.next()) {
                 client = new Cliente();
                 client.setId(rs.getInt("id"));
                 client.setName(rs.getString("name"));
                 client.setLogin(rs.getString("login"));
                 client.setPassword(rs.getString("password"));
    			
    		}
    	}catch(Exception e) {
    		System.out.println(e);
    	}
    	return client;
    }
    
    public static int updateCliente(Cliente c) {
    	int status = 0;
    	
    	try {
    		Connection conn = getConnection();
    		PreparedStatement ps = (PreparedStatement) conn.prepareStatement("UPDATE client SET name=?,"
    				+ "login=?, password=? WHERE id=?");
    		
    		ps.setString(1, c.getName());
    		ps.setString(2, c.getLogin());
    		ps.setString(3, c.getPassword());
    		ps.setInt(4, c.getId());
    		status = ps.executeUpdate();
    	}catch(Exception e) {
    		System.out.println(e);
    	}
    	return status;
    }
    
    public static List<Cliente> getAllClientes(){
        List<Cliente> list = new ArrayList<Cliente>();

        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM client");
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Cliente client = new Cliente();
                client.setId(rs.getInt("id"));
                client.setName(rs.getString("name"));
                client.setLogin(rs.getString("login"));
                client.setPassword(rs.getString("password"));
                list.add(client);
            }
        } catch(Exception e) {
            System.out.println(e);
        }
        return list;
    }
    

}