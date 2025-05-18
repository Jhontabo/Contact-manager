// src/main/java/com/contactmanager/controller/ListContactServlet.java
package com.contactmanager.controller;

import com.contactmanager.db.SinglyLinkedList;
import com.contactmanager.model.Contact;
import com.contactmanager.storage.FileStorage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

public class ListContactServlet extends HttpServlet {
    private FileStorage storage;

    @Override
    public void init() throws ServletException {
        // Se ejecuta al arrancar el servlet
        String path = getServletContext().getRealPath("/WEB-INF/resources/contacts.txt");
        storage = new FileStorage(path);
    }

 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Carga la lista desde el archivo
        SinglyLinkedList list = storage.load();
        List<Contact> contacts = list.toList();

        // La ponemos como atributo para la JSP
        req.setAttribute("contacts", contacts);

        // Forward a list.jsp
        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/listContacts.jsp");
        rd.forward(req, resp);
    }
}

