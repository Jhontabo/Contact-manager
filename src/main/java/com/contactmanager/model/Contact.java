package com.contactmanager.model;

import java.util.Objects;
import java.util.UUID;

/**
 * Representa un contacto en el sistema.
 */
public class Contact {
    private String id;
    private String name;
    private String email;
    private String phone;

    // Constructor vacío (por si acaso)
    public Contact() {
        this.id = UUID.randomUUID().toString();
    }

    // Constructor usado para cargar desde el archivo (con id conocido)
    public Contact(String id ,String name, String email, String phone) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }

    // NUEVO: Constructor para nuevos contactos (id se genera solo)
    public Contact(String name, String email, String phone) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.email = email;
        this.phone = phone;
    }

    // Getters y setters...

    public String getId() {
        return id;
    }
    // No hay setter de id para evitar cambios accidentales

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Contact{" +
               "id='" + id + '\'' +
               ", name='" + name + '\'' +
               ", email='" + email + '\'' +
               ", phone='" + phone + '\'' +
               '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Contact contact = (Contact) o;
        // Igualdad basada en ID
        return Objects.equals(id, contact.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}

