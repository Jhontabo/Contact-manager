package com.contactmanager.controller;

import com.contactmanager.db.SinglyLinkedList;
import com.contactmanager.model.Contact;
import com.contactmanager.storage.FileStorage;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;

public class CreateContactServlet extends HttpServlet {
    private FileStorage storage;

    @Override
    public void init() throws ServletException {
        String path = getServletContext().getRealPath("/WEB-INF/resources/contacts.txt");
        storage = new FileStorage(path);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/newContact.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        // Carga los contactos existentes
        SinglyLinkedList list = storage.load();

        // Crea y agrega el contacto
        Contact contact = new Contact(name, email, phone);
        list.add(contact);

        // Guarda en archivo
        storage.save(list);

        // Redirige a la lista de contactos
        resp.sendRedirect(req.getContextPath() + "/contacts");
    }
}

