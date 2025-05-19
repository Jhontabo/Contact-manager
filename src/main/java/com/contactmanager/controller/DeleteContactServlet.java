package com.contactmanager.controller;

import com.contactmanager.db.SinglyLinkedList;
import com.contactmanager.model.Contact;
import com.contactmanager.storage.FileStorage;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class DeleteContactServlet extends HttpServlet {
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
        boolean deleted = false;

        if (id != null && !id.isEmpty()) {
            SinglyLinkedList list = storage.load();
            List<Contact> contacts = list.toList();

            Contact toDelete = null;
            for (Contact c : contacts) {
                if (id.equals(c.getId())) {
                    toDelete = c;
                    break;
                }
            }

            if (toDelete != null) {
                contacts.remove(toDelete);
                // Guarda la lista sin el contacto eliminado
                list.clear();
                for (Contact c : contacts) {
                    list.add(c);
                }
                storage.save(list);
                deleted = true;
            }
        }
        // Redirige a la lista, puedes mostrar un mensaje usando querystring si quieres
        resp.sendRedirect(req.getContextPath() + "/contacts");
    }
}

