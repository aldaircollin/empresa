
package Intefaces;


import Modelo.Producto;
import java.util.List;


public interface CRUD {
    public List listar();
    public Producto list(int codigo);
    public boolean add(Producto pro);
    public boolean edit(Producto pro);
    public boolean eliminar(int codigo);
}
