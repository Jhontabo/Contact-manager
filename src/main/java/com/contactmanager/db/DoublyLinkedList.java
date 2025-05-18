package com.contactmanager.db;

import com.contactmanager.model.Contact;

import java.util.ArrayList;
import java.util.List;

/**
 * Implementación de una lista doblemente enlazada para Contact.
 */
public class DoublyLinkedList {
    /**
     * Nodo interno con referencias a anterior y siguiente.
     */
    private static class Node {
        Contact data;
        Node prev;
        Node next;
        Node(Contact data) {
            this.data = data;
        }
    }

    private Node head;
    private Node tail;

    /**
     * Añade un contacto al final de la lista.
     */
    public void add(Contact contact) {
        Node nuevo = new Node(contact);
        if (head == null) {
            head = tail = nuevo;
        } else {
            tail.next = nuevo;
            nuevo.prev = tail;
            tail = nuevo;
        }
    }

    /**
     * Busca y devuelve el Contact por id, o null si no existe.
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
     * Elimina el nodo cuyo contacto tenga el id dado.
     * Devuelve true si se eliminó.
     */
    public boolean removeById(String id) {
        Node curr = head;
        while (curr != null) {
            if (curr.data.getId().equals(id)) {
                // Si es cabeza
                if (curr.prev == null) {
                    head = curr.next;
                } else {
                    curr.prev.next = curr.next;
                }
                // Si es cola
                if (curr.next == null) {
                    tail = curr.prev;
                } else {
                    curr.next.prev = curr.prev;
                }
                return true;
            }
            curr = curr.next;
        }
        return false;
    }

    /**
     * Actualiza un contacto existente. Retorna true si encontró el id.
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
     * Convierte la lista en una List<Contact> para iterar o persistir.
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
     * Limpia toda la lista (head y tail a null).
     */
    public void clear() {
        head = null;
        tail = null;
    }
}

