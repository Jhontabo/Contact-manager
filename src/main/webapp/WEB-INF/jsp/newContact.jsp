<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nuevo Contacto</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f7fafd; }
        .container { max-width: 400px; margin: 45px auto; background: #fff; padding: 36px; border-radius: 16px; box-shadow: 0 2px 18px rgba(0,0,0,0.09);}
        h1 { color: #2b396e; margin-bottom: 20px; }
        label { font-weight: bold; }
        input[type=text], input[type=email] { width: 100%; padding: 8px; margin: 8px 0 14px 0; border: 1px solid #ccd2e3; border-radius: 6px;}
        button { padding: 10px 30px; background: #2b8ccc; color: #fff; border: none; border-radius: 8px; font-size: 1em; cursor: pointer;}
        button:hover { background: #2762a1;}
        a { color: #2b8ccc; text-decoration: none;}
    </style>
</head>
<body>
<div class="container">
    <h1>Nuevo Contacto</h1>
    <form action="<%=request.getContextPath()%>/contacts/create" method="post">
        <label>Nombre:</label>
        <input type="text" name="name" required>
        <label>Email:</label>
        <input type="email" name="email" required>
        <label>Teléfono:</label>
        <input type="text" name="phone" required>
        <br>
        <button type="submit">Guardar</button>
        &nbsp; <a href="<%=request.getContextPath()%>/contacts">Cancelar</a>
    </form>
</div>
</body>
</html>

