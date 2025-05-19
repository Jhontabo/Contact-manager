<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.contactmanager.model.Contact" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Contacto</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f7fafd; }
        .container { max-width: 400px; margin: 45px auto; background: #fff; padding: 36px; border-radius: 16px; box-shadow: 0 2px 18px rgba(0,0,0,0.09);}
        h1 { color: #2b396e; margin-bottom: 20px; }
        label { font-weight: bold; color: #444; }
        input[type="text"], input[type="email"] { width: 100%; padding: 8px; margin-bottom: 12px; border-radius: 6px; border: 1px solid #b7c4da; }
        .actions { margin-top: 24px; }
        .btn { background: #2b8ccc; color: #fff; border: none; border-radius: 6px; padding: 10px 24px; font-size: 1em; cursor: pointer; }
        .btn-cancel { background: #ccc; color: #222; margin-left: 12px;}
    </style>
</head>
<body>
<div class="container">
    <h1>Editar Contacto</h1>
    <%
        Contact contact = (Contact) request.getAttribute("contact");
        if (contact != null) {
    %>
        <form method="post" action="<%=request.getContextPath()%>/contacts/edit">
            <input type="hidden" name="id" value="<%=contact.getId()%>"/>
            <label>Nombre</label>
            <input type="text" name="name" value="<%=contact.getName()%>" required/>
            <label>Email</label>
            <input type="email" name="email" value="<%=contact.getEmail()%>" required/>
            <label>Teléfono</label>
            <input type="text" name="phone" value="<%=contact.getPhone()%>" required/>
            <div class="actions">
                <button type="submit" class="btn">Guardar cambios</button>
                <a href="<%=request.getContextPath()%>/contacts" class="btn btn-cancel">Cancelar</a>
            </div>
        </form>
    <%
        } else {
    %>
        <p>Contacto no encontrado.</p>
        <a href="<%=request.getContextPath()%>/contacts" class="btn btn-cancel">Volver</a>
    <%
        }
    %>
</div>
</body>
</html>

