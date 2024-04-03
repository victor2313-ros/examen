package com.emergentes;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        estudiante objest = new estudiante();
        int id, pos;
        HttpSession ses = request.getSession();
        ArrayList<estudiante> lista = (ArrayList<estudiante>) ses.getAttribute("listaper");

        switch (op) {
            case "nuevo":
                request.setAttribute("miobjest", objest);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(lista, id);
                if (pos >= 0 && pos < lista.size()) {
                    objest = lista.get(pos);
                    request.setAttribute("miobjest", objest);
                    request.getRequestDispatcher("editar.jsp").forward(request, response);
                }
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(lista, id);
                if (pos >= 0 && pos < lista.size()) {
                    lista.remove(pos);
                }
                response.sendRedirect("index.jsp");
                break;
            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        ArrayList<estudiante> lista = (ArrayList<estudiante>) ses.getAttribute("listaper");

        int id = Integer.parseInt(request.getParameter("id"));
        String nom_ape = request.getParameter("nom_ape");
        int p1 = Integer.parseInt(request.getParameter("p1"));
        int p2 = Integer.parseInt(request.getParameter("p2"));
        int p3 = Integer.parseInt(request.getParameter("p3"));
        double nota = p1 + p2 + p3;
        estudiante objest = new estudiante();
        objest.setId(id);
        objest.setNomApe(nom_ape);
        objest.setP1(p1);
        objest.setP2(p2);
        objest.setP3(p3);
        objest.setNota((int) nota);

        if (id == 0) {
            int newId = obtenerNuevoId(lista);
            objest.setId(newId);
            lista.add(objest);
        } else {
            int pos = buscarPorIndice(lista, id);
            if (pos >= 0 && pos < lista.size()) {
                lista.set(pos, objest);
            }
        }

        ses.setAttribute("listaper", lista);
        response.sendRedirect("index.jsp");
    }

    public int buscarPorIndice(ArrayList<estudiante> lista, int id) {
        int pos = -1;
        if (lista != null) {
            for (int i = 0; i < lista.size(); i++) {
                if (lista.get(i).getId() == id) {
                    pos = i;
                    break;
                }
            }
        }
        return pos;
    }

    public int obtenerNuevoId(ArrayList<estudiante> lista) {
        int newId = 1;
        for (estudiante ele : lista) {
            if (ele.getId() >= newId) {
                newId = ele.getId() + 1;
            }
        }
        return newId;
    }
}
