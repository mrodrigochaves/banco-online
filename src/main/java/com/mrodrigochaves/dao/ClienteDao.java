package com.mrodrigochaves.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mrodrigochaves.bean.Cliente;

public class ClienteDao {
    
    // Obtém a conexão com o banco de dados
    public static Connection getConnection(){
        Connection conn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_bank", "admin", "abcd1234");
        } catch(Exception e){
            System.out.println(e);
        }
        return conn;
    }
    
    // Valida o login do cliente
    public static Cliente getValidateLogin(String login, String password) {
        Cliente client = null;
        
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM client WHERE login = ? AND password = ?");
            ps.setString(1, login);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                // Obtém os dados do resultado da consulta
                client = new Cliente();
                client.setLogin(rs.getString("login"));
                client.setPassword(rs.getString("password"));
            }
        } catch(Exception e) {
            System.out.println(e);
        }
        return client;
    }
    
    // Deleta um cliente
    public static int deleteClient(Cliente c) {
        int status = 0;
        
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM client WHERE id = ?");
            ps.setInt(1, c.getId());
            status = ps.executeUpdate();
        } catch(Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
    // Salva um cliente
    public static int saveClient(Cliente c) {
        int status = 0;
        
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO client (name, login, password) VALUES (?,?,?)");
            ps.setString(1, c.getName());
            ps.setString(2, c.getLogin());
            ps.setString(3, c.getPassword());
            status = ps.executeUpdate();
        } catch(Exception e) {
            System.out.println(e);
        }
        return status;
    }

    // Obtém um cliente pelo seu ID
    public static Cliente getRegisterById(int id) {
        Cliente client = null;  
        
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM client WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                // Obtém os dados do resultado da consulta
                client = new Cliente();
                client.setId(rs.getInt("id"));
                client.setName(rs.getString("name"));
                client.setLogin(rs.getString("login"));
                client.setPassword(rs.getString("password"));
            }
        } catch(Exception e) {
            System.out.println(e);
        }
        return client;
    }
    
    // Atualiza os dados de um cliente
    public static int updateCliente(Cliente c) {
        int status = 0;
        
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE client SET name = ?, login = ?, password = ? WHERE id = ?");
            
            ps.setString(1, c.getName());
            ps.setString(2, c.getLogin());
            ps.setString(3, c.getPassword());
            ps.setInt(4, c.getId());
            
            status = ps.executeUpdate();
        } catch(Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
    // Obtém todos os clientes
    public static List<Cliente> getAllClientes(){
        List<Cliente> list = new ArrayList<Cliente>();

        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM client");
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                // Obtém os dados do resultado da consulta
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
