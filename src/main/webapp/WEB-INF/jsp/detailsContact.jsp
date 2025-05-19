<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.contactmanager.model.Contact" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalles de Contacto</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f7fafd; }
        .container { max-width: 400px; margin: 45px auto; background: #fff; padding: 36px; border-radius: 16px; box-shadow: 0 2px 18px rgba(0,0,0,0.09);}
        h1 { color: #2b396e; margin-bottom: 20px; }
        .label { color: #888; font-size: 1.1em; }
        .value { font-size: 1.2em; margin-bottom: 16px; }
        .row { margin-bottom: 12px; }
        a { color: #2b8ccc; text-decoration: none;}
        .actions { margin-top: 24px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Detalles del Contacto</h1>
    <%
        Contact contact = (Contact) request.getAttribute("contact");
        if (contact != null) {
    %>
        <div class="row"><span class="label">Nombre:</span><br>
            <span class="value"><%= contact.getName() %></span>
        </div>
        <div class="row"><span class="label">Email:</span><br>
            <span class="value"><%= contact.getEmail() %></span>
        </div>
        <div class="row"><span class="label">Teléfono:</span><br>
            <span class="value"><%= contact.getPhone() %></span>
        </div>
        <div class="row"><span class="label">ID:</span><br>
            <span class="value"><%= contact.getId() %></span>
        </div>
        <div class="actions">
            <a href="<%=request.getContextPath()%>/contacts">Volver a la lista</a>
        </div>
    <%
        } else {
    %>
        <p>Contacto no encontrado.</p>
        <a href="<%=request.getContextPath()%>/contacts">Volver a la lista</a>
    <%
        }
    %>
</div>
</body>
</html>

