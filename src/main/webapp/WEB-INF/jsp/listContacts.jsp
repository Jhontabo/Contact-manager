<%-- src/main/webapp/WEB-INF/jsp/listContacts.jsp --%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.contactmanager.model.Contact, java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Contact Manager – Lista</title>
  <link rel="stylesheet" href="<c:url value='/static/css/styles.css'/>">

</head>
<body>
  <h1>Lista de Contactos</h1>
  <p><a href="<c:url value='/contacts/new'/>">Crear nuevo contacto</a></p>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Nombre</th>
        <th>Email</th>
        <th>Teléfono</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
      <%
        List<Contact> contacts = (List<Contact>) request.getAttribute("contacts");
        if (contacts != null && !contacts.isEmpty()) {
          for (Contact c : contacts) {
      %>
      <tr>
        <td><%= c.getName() %></td>
        <td><%= c.getEmail() %></td>
        <td><%= c.getPhone() %></td>
        <td>
          <a href="<%= request.getContextPath() + "/contacts/details?id=" + c.getId() %>">Ver</a> |
          <a href="<%= request.getContextPath() + "/contacts/edit?id="    + c.getId() %>">Editar</a> |
          <a href="<%= request.getContextPath() + "/contacts/delete?id="  + c.getId() %>">Eliminar</a>
        </td>
      </tr>
      <%
          }
        } else {
      %>
      <tr>
        <td colspan="4">No hay contactos registrados.</td>
      </tr>
      <% } %>
    </tbody>
  </table>
</body>
</html>

