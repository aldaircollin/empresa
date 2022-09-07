
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="http://localhost:8080/empresa/">EMPRESA</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="http://localhost:8080/empresa/">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controlador?accion=listar">Productos</a>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </div>
        </nav>
        <br>
        <div class="container">
            <h1 class="text-danger">Productos</h1>
            <a class="btn btn-success" href="Controlador?accion=add"><i class="fa fa-plus-square fa-lg" aria-hidden="true"> Agregar Nuevo</i></a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center col-1">Codigo</th>
                        <th class="text-center col-4">Nombre</th>
                        <th class="text-center col-4">Marca</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    ProductoDAO dao=new ProductoDAO();
                    List<Producto>list=dao.listar();
                    Iterator<Producto>iter=list.iterator();
                    Producto pro=null;
                    while(iter.hasNext()){
                        pro=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center text-danger"><%= pro.getCodigo()%></td>
                        <td class="text-center"><%= pro.getNombre()%></td>
                        <td class="text-center"><%= pro.getMarca()%></td>
                        <td class="text-center">
                            <a class="btn btn-outline-warning" href="Controlador?accion=editar&codigo=<%= pro.getCodigo()%>"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a>
                            <a class="btn btn-outline-danger" href="Controlador?accion=eliminar&codigo=<%= pro.getCodigo()%>"><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i></a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
