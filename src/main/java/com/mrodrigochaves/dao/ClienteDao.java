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
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_banco","root","");
        } catch(Exception e){
            System.out.println(e);
        }
        return conn;
    }

    public static List<Cliente> getAllUsuarios(){
        List<Cliente> list = new ArrayList<Cliente>();

        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM usuario");
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Cliente usuario = new Cliente();
                usuario.setId(rs.getInt("id"));
                usuario.setName(rs.getString("name"));
                usuario.setLogin(rs.getString("login"));
                usuario.setPassword(rs.getString("password"));
                list.add(usuario);
            }
        } catch(Exception e) {
            System.out.println(e);
        }
        return list;
    }
    

}
