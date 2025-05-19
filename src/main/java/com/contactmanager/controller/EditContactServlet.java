package com.contactmanager.controller;

import com.contactmanager.db.SinglyLinkedList;
import com.contactmanager.model.Contact;
import com.contactmanager.storage.FileStorage;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

public class EditContactServlet extends HttpServlet {
    private FileStorage storage;

    @Override
    public void init() throws ServletException {
        String path = getServletContext().getRealPath("/WEB-INF/resources/contacts.txt");
        storage = new FileStorage(path);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Muestra el formulario de edición con los datos actuales
        String id = req.getParameter("id");
        Contact found = null;

        if (id != null && !id.isEmpty()) {
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
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/editContact.jsp");
            rd.forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/contacts");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Recibe el formulario de edición
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        boolean updated = false;

        if (id != null && !id.isEmpty()) {
            SinglyLinkedList list = storage.load();
            List<Contact> contacts = list.toList();

            for (Contact c : contacts) {
                if (id.equals(c.getId())) {
                    c.setName(name);
                    c.setEmail(email);
                    c.setPhone(phone);
                    updated = true;
                    break;
                }
            }
            // Guarda la lista actualizada
            if (updated) {
                list.clear();
                for (Contact c : contacts) {
                    list.add(c);
                }
                storage.save(list);
            }
        }
        // Redirige a la lista (o podrías volver al detalle)
        resp.sendRedirect(req.getContextPath() + "/contacts");
    }
}

