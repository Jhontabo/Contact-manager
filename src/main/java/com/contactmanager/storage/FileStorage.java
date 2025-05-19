package com.contactmanager.storage;

import com.contactmanager.db.SinglyLinkedList;
import com.contactmanager.model.Contact;

import java.io.*;
import java.util.List;

/**
 * Gestiona la carga y guardado de contactos en un archivo de texto.
 * Cada línea con formato: id|name|email|phone
 */
public class FileStorage {

    private final String filePath;

    /**
     * @param filePath Ruta al archivo (p. ej. servletContext.getRealPath("/WEB-INF/contacts.txt"))
     */
    public FileStorage(String filePath) {
        this.filePath = filePath;
    }

    /**
     * Carga todos los contactos desde el archivo en una SinglyLinkedList.
     */
    public SinglyLinkedList load() throws IOException {
        SinglyLinkedList list = new SinglyLinkedList();
        File file = new File(filePath);

        if (!file.exists()) {
            file.getParentFile().mkdirs();
            file.createNewFile();
            return list;
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 4) {
                    Contact c = new Contact(parts[0], parts[1], parts[2], parts[3]);
                    list.add(c);
                }
            }
        }

        return list;
    }

    /**
     * Sobrescribe el archivo con el contenido de la lista dada.
     */
    public void save(SinglyLinkedList list) throws IOException {
        File file = new File(filePath);
        file.getParentFile().mkdirs();

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file))) {
            List<Contact> contacts = list.toList();
            for (Contact c : contacts) {
                bw.write(String.join("|",
                    c.getId(),
                    c.getName(),
                    c.getEmail(),
                    c.getPhone()
                ));
                bw.newLine();
            }
        }
    }
}
