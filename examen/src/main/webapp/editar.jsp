<%@page import="com.emergentes.estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    estudiante est = (estudiante)request.getAttribute("miobjest");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro de Estudiantes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
        }
        form {
            margin: 0 auto;
            width: 50%;
        }
        table {
            width: 100%;
        }
        table td {
            padding: 8px;
        }
        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        input[type="text"],
        input[type="number"],
        input[type="submit"] {
            width: 100%;
            padding: 5px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <h1>Registro de Estudiante</h1>
    <form action="MainServlet" method="post">
        <table>
            <tr>
                <td>id</td>
                <td><input type="text" name="id" value="<%= est.getId() %>" readonly></td>
            </tr>
            <tr>
                <td>Nombre</td>
                <td><input type="text" name="nom_ape" value="<%= est.getNomApe() %>"></td>
            </tr>
            <tr>
                <td>P1(30)</td>
                <td><input type="number" name="p1" value="<%= est.getP1() %>"></td>
            </tr>
            <tr>
                <td>P2(30)</td>
                <td><input type="number" name="p2" value="<%= est.getP2() %>"></td>
            </tr>
            <tr>
                <td>EF(40)</td>
                <td><input type="number" name="p3" value="<%= est.getP3() %>"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="enviar"></td>
            </tr>
        </table>
    </form>
</body>
</html>
