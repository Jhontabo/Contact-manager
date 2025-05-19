package com.contactmanager.controller;

import com.contactmanager.db.SinglyLinkedList;
import com.contactmanager.model.Contact;
import com.contactmanager.storage.FileStorage;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

/**
 * Servlet para mostrar los detalles de un contacto específico.
 * Recibe el parámetro ?id=...
 */
public class DetailsContactServlet extends HttpServlet {
    private FileStorage storage;

    @Override
    public void init() throws ServletException {
        String path = getServletContext().getRealPath("/WEB-INF/resources/contacts.txt");
        storage = new FileStorage(path);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = req.getParameter("id");
        Contact found = null;

        if (id != null && !id.isEmpty()) {
            // Carga los contactos existentes
            SinglyLinkedList list = storage.load();
            List<Contact> contacts = list.toList();
            for (Contact c : contacts) {
                if (id.equals(c.getId())) {
                    found = c;
                    break;
                }
            }
        }

        if (found != null) {
            req.setAttribute("contact", found);
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/detailsContact.jsp");
            rd.forward(req, resp);
        } else {
            // Si no se encuentra el contacto, redirige a la lista
            resp.sendRedirect(req.getContextPath() + "/contacts");
        }
    }
}

