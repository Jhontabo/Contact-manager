package com.contactmanager.db;

import com.contactmanager.model.Contact;

import java.util.ArrayList;
import java.util.List;

/**
 * Implementación de una lista simplemente enlazada para Contact.
 */
public class SinglyLinkedList {
    /**
     * Nodo interno que envuelve un Contact.
     */
    private static class Node {
        Contact data;
        Node next;
        Node(Contact data) {
            this.data = data;
        }
    }

    private Node head;

    /**
     * Añade un contacto al final de la lista.
     */
    public void add(Contact contact) {
        Node nuevo = new Node(contact);
        if (head == null) {
            head = nuevo;
        } else {
            Node curr = head;
            while (curr.next != null) {
                curr = curr.next;
            }
            curr.next = nuevo;
        }
    }

    /**
     * Devuelve el contacto cuyo id coincide, o null si no existe.
     */
    public Contact getById(String id) {
        Node curr = head;
        while (curr != null) {
            if (curr.data.getId().equals(id)) {
                return curr.data;
            }
            curr = curr.next;
        }
        return null;
    }

    /**
     * Elimina el contacto con el id dado. Retorna true si lo eliminó.
     */
    public boolean removeById(String id) {
        if (head == null) return false;

        // Caso: cabeza
        if (head.data.getId().equals(id)) {
            head = head.next;
            return true;
        }

        Node prev = head;
        Node curr = head.next;
        while (curr != null) {
            if (curr.data.getId().equals(id)) {
                prev.next = curr.next;
                return true;
            }
            prev = curr;
            curr = curr.next;
        }
        return false;
    }

    /**
     * Actualiza un contacto existente por id. 
     * Retorna true si encontró y actualizó.
     */
    public boolean update(Contact contact) {
        Node curr = head;
        while (curr != null) {
            if (curr.data.getId().equals(contact.getId())) {
                curr.data.setName(contact.getName());
                curr.data.setEmail(contact.getEmail());
                curr.data.setPhone(contact.getPhone());
                return true;
            }
            curr = curr.next;
        }
        return false;
    }

    /**
     * Devuelve todos los contactos en una lista Java.
     */
    public List<Contact> toList() {
        List<Contact> list = new ArrayList<>();
        Node curr = head;
        while (curr != null) {
            list.add(curr.data);
            curr = curr.next;
        }
        return list;
    }

    /**
     * Vacía la lista.
     */
    public void clear() {
        head = null;
    }
}

