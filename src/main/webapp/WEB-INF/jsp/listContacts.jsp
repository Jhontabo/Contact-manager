<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Manager – Lista</title>
  <link href="https://fonts.googleapis.com/css2?family=Google+Sans:ital,wght@0,400;0,500;0,700;1,400&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <style>
    :root {
      --primary-color: #1a73e8;
      --primary-light: #e8f0fe;
      --text-dark: #202124;
      --text-medium: #5f6368;
      --text-light: #80868b;
      --bg-light: #f8f9fa;
      --border-color: #dadce0;
      --hover-bg: #f1f3f4;
      --card-shadow: 0 1px 2px 0 rgba(60,64,67,0.3), 0 1px 3px 1px rgba(60,64,67,0.15);
      --success-color: #34a853;
      --warning-color: #f9ab00;
      --danger-color: #d93025;
    }
    
    body {
      font-family: 'Google Sans', Arial, sans-serif;
      background: var(--bg-light);
      margin: 0;
      padding: 0;
      color: var(--text-dark);
    }
    
    .app-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 16px 24px;
    }
    
    .app-header {
      display: flex;
      align-items: center;
      padding: 8px 0;
      margin-bottom: 24px;
    }
    
    .app-title {
      font-size: 22px;
      font-weight: 500;
      color: var(--text-dark);
      margin: 0;
      padding: 8px 0;
      display: flex;
      align-items: center;
    }
    
    .app-title .material-icons {
      color: var(--primary-color);
      margin-right: 16px;
      font-size: 24px;
    }
    
    .search-container {
      margin-left: auto;
      display: flex;
      align-items: center;
      background: white;
      border-radius: 8px;
      border: 1px solid var(--border-color);
      padding: 8px 16px;
      width: 50%;
      max-width: 600px;
    }
    
    .search-container .material-icons {
      color: var(--text-light);
      margin-right: 8px;
    }
    
    .search-input {
      border: none;
      outline: none;
      width: 100%;
      font-family: 'Google Sans', Arial, sans-serif;
      font-size: 14px;
      color: var(--text-dark);
    }
    
    .action-buttons {
      display: flex;
      margin-left: 16px;
    }
    
    .btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      padding: 8px 24px;
      border-radius: 4px;
      font-weight: 500;
      font-size: 14px;
      cursor: pointer;
      text-decoration: none;
      transition: background-color 0.2s;
      height: 36px;
      box-sizing: border-box;
    }
    
    .btn-primary {
      background-color: var(--primary-color);
      color: white;
      border: none;
    }
    
    .btn-primary:hover {
      background-color: #1765cc;
      box-shadow: 0 1px 2px 0 rgba(66,133,244,0.3), 0 1px 3px 1px rgba(66,133,244,0.15);
    }
    
    .btn-icon {
      min-width: 48px;
      padding: 0;
      border-radius: 50%;
      background: transparent;
      color: var(--text-medium);
      margin-left: 8px;
    }
    
    .btn-icon:hover {
      background: var(--hover-bg);
    }
    
    .contacts-container {
      background: white;
      border-radius: 8px;
      box-shadow: var(--card-shadow);
      overflow: hidden;
    }
    
    .contacts-header {
      display: grid;
      grid-template-columns: 40px 1fr 1fr 1fr 80px;
      padding: 16px 24px;
      border-bottom: 1px solid var(--border-color);
      background: white;
      font-weight: 500;
      color: var(--text-medium);
      font-size: 14px;
    }
    
    .contact-row {
      display: grid;
      grid-template-columns: 40px 1fr 1fr 1fr 80px;
      padding: 12px 24px;
      align-items: center;
      border-bottom: 1px solid var(--border-color);
      transition: background-color 0.2s;
    }
    
    .contact-row:hover {
      background-color: var(--hover-bg);
    }
    
    .contact-row:last-child {
      border-bottom: none;
    }
    
    .contact-checkbox {
      width: 18px;
      height: 18px;
    }
    
    .contact-name {
      font-weight: 500;
      color: var(--text-dark);
      display: flex;
      align-items: center;
    }
    
    .contact-avatar {
      width: 32px;
      height: 32px;
      border-radius: 50%;
      background-color: var(--primary-light);
      color: var(--primary-color);
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 500;
      margin-right: 16px;
      font-size: 14px;
    }
    
    .contact-email, .contact-phone {
      color: var(--text-medium);
      font-size: 14px;
    }
    
    .contact-actions {
      display: flex;
      justify-content: flex-end;
    }
    
    .action-icon {
      color: var(--text-light);
      cursor: pointer;
      padding: 8px;
      border-radius: 50%;
      transition: background-color 0.2s;
    }
    
    .action-icon:hover {
      background-color: rgba(0,0,0,0.1);
    }
    
    .empty-state {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 48px 24px;
      color: var(--text-light);
      text-align: center;
    }
    
    .empty-icon {
      font-size: 48px;
      margin-bottom: 16px;
      color: var(--border-color);
    }
    
    .empty-text {
      font-size: 16px;
      margin-bottom: 24px;
    }
    
    @media (max-width: 768px) {
      .app-container {
        padding: 16px;
      }
      
      .app-header {
        flex-wrap: wrap;
      }
      
      .search-container {
        order: 3;
        width: 100%;
        margin-top: 16px;
        margin-left: 0;
      }
      
      .contacts-header, .contact-row {
        grid-template-columns: 1fr 1fr 1fr 60px;
      }
      
      .contact-checkbox {
        display: none;
      }
      
      .contact-name .contact-avatar {
        display: none;
      }
    }
  </style>
</head>
<body>
  <div class="app-container">
    <div class="app-header">
      <h1 class="app-title">
        <span class="material-icons">contacts</span>
        Contactos
      </h1>
      
      <div class="search-container">
        <span class="material-icons">search</span>
        <input type="text" class="search-input" placeholder="Buscar contactos...">
      </div>
      
      <div class="action-buttons">
        <a href="<c:url value='/contacts/new'/>" class="btn btn-primary">
          <span class="material-icons" style="margin-right: 8px;">add</span>
          Crear contacto
        </a>
        <button class="btn btn-icon">
          <span class="material-icons">more_vert</span>
        </button>
      </div>
    </div>
    
    <div class="contacts-container">
      <div class="contacts-header">
        <div><input type="checkbox" class="contact-checkbox"></div>
        <div>Nombre</div>
        <div>Email</div>
        <div>Teléfono</div>
        <div></div>
      </div>
      
      <c:choose>
        <c:when test="${not empty contacts}">
          <c:forEach var="c" items="${contacts}">
            <div class="contact-row">
              <div><input type="checkbox" class="contact-checkbox"></div>
              <div class="contact-name">
                <div class="contact-avatar">${c.name.charAt(0)}</div>
                ${c.name}
              </div>
              <div class="contact-email">${c.email}</div>
              <div class="contact-phone">${c.phone}</div>
              <div class="contact-actions">
                <span class="material-icons action-icon" onclick="window.location.href='<c:url value='/contacts/details?id=${c.id}'/>'">visibility</span>
                <span class="material-icons action-icon" onclick="window.location.href='<c:url value='/contacts/edit?id=${c.id}'/>'">edit</span>
                <span class="material-icons action-icon" onclick="window.location.href='<c:url value='/contacts/delete?id=${c.id}'/>'">delete</span>
              </div>
            </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <div class="empty-state">
            <span class="material-icons empty-icon">contact_mail</span>
            <div class="empty-text">No hay contactos</div>
            <a href="<c:url value='/contacts/new'/>" class="btn btn-primary">
              <span class="material-icons" style="margin-right: 8px;">add</span>
              Crear contacto
            </a>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</body>
</html>
