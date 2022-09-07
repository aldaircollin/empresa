/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Intefaces.CRUD;
import Modelo.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductoDAO implements CRUD{
 Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Producto p=new Producto();
    @Override
    public List listar() {
        
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from producto";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto pro = new Producto();
                pro.setCodigo(rs.getInt("codigo"));
                pro.setNombre(rs.getString("nombre"));
                pro.setMarca(rs.getString("marca"));
                list.add(pro);
            }
        } catch (Exception e) {
        }
        return list;  
    }

    @Override
    public Producto list(int codigo) {

        String sql = "select * from producto where codigo=" + codigo;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setCodigo(rs.getInt("codigo"));
                p.setNombre(rs.getString("nombre"));
                p.setMarca(rs.getString("marca"));

            }
        } catch (Exception e) {
        }
        return p;

    }

    @Override
    public boolean add(Producto pro) {
        
        String sql = "insert into producto(nombre, marca)values('" + pro.getNombre()+ "','" + pro.getMarca()+ "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean edit(Producto pro) {

        String sql = "update producto set nombre='" + pro.getNombre()+ "',marca='" + pro.getMarca()+ "'where codigo=" + pro.getCodigo();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;

    }

    @Override
    public boolean eliminar(int codigo) {

        String sql = "delete from producto where codigo=" + codigo;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
        
    }
    
}
