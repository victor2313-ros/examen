<%@page import="com.emergentes.estudiante"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("listaper") == null) {
        ArrayList<estudiante> lista = new ArrayList<>();
        session.setAttribute("listaper", lista);
    }
    ArrayList<estudiante> lista = (ArrayList<estudiante>) session.getAttribute("listaper");
%>

<%@page import="com.emergentes.estudiante"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro de Calificaciones</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1, h2, h3 {
            text-align: center;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            border: 1px solid #dddddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        button{
            margin-left: 140px;
        }
    </style>
</head>
<body>
    <h1>PRIMER PARCIAL TEM-742</h1>
    <h2>Nombre: Victor Hugo Rosa Mamani</h2>
    <h3>Carnet: 13873717</h3>
    <h1>REGISTRO DE CALIFICACIONES</h1>
    <form action="MainServlet" method="get">
        <input type="hidden" name="op" value="nuevo">
        <button type="submit">Nuevo</button>
    </form>
    <br>
    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>P1(30)</th>
                <th>P2(30)</th>
                <th>P3(40)</th>
                <th>Nota</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <% 
                if (lista != null) {
                    for (estudiante item : lista) {
            %>
            <tr>
                <td><%= item.getId() %></td>
                <td><%= item.getNomApe()%></td>
                <td><%= item.getP1() %></td>
                <td><%= item.getP2() %></td>
                <td><%= item.getP3() %></td>
                <td><%= item.getNota() %></td>
                <td><a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a></td>
                <td><a href="MainServlet?op=eliminar&id=<%= item.getId() %>" onclick="return confirm('¿Está seguro de eliminar?')">Eliminar</a></td>
            </tr>
            <% 
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
