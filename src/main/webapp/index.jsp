<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido a ContactManager</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3a0ca3;
            --accent-color: #4cc9f0;
            --text-color: #2b2d42;
            --light-bg: #f8f9fa;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            color: var(--text-color);
            overflow: hidden;
        }
        
        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 40px 60px;
            text-align: center;
            max-width: 500px;
            position: relative;
            z-index: 10;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transform: scale(1);
            animation: pulse 2s infinite alternate;
        }
        
        @keyframes pulse {
            0% { transform: scale(0.98); }
            100% { transform: scale(1.02); }
        }
        
        h1 {
            color: var(--primary-color);
            font-size: 2.5em;
            margin-bottom: 10px;
            font-weight: 600;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .subtitle {
            color: #666;
            font-size: 1.1em;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        
        .logo {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border-radius: 50%;
            color: white;
            font-size: 2em;
            font-weight: bold;
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }
        
        .btn-primary {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 1em;
            border-radius: 50px;
            cursor: pointer;
            margin-top: 20px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 20px rgba(67, 97, 238, 0.4);
        }
        
        .btn-primary:active {
            transform: translateY(1px);
        }
        
        .small {
            color: #aaa;
            font-size: 0.85em;
            margin-top: 25px;
        }
        
        a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
        
        .floating-contacts {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }
        
        .contact-circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(67, 97, 238, 0.1);
            animation: float 15s infinite linear;
        }
        
        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); }
            100% { transform: translateY(-1000px) rotate(720deg); }
        }
    </style>
</head>
<body>
    <div class="floating-contacts" id="floatingContacts"></div>
    
    <div class="container">
        <div class="logo">CM</div>
        <h1>Bienvenido a ContactManager</h1>
        <div class="subtitle">Tu solución completa para gestionar contactos de forma sencilla y eficiente</div>
        
        <button class="btn-primary" onclick="window.location.href='<%=request.getContextPath()%>/contacts'">
            Acceder a mis contactos
        </button>
        
        <div class="small">Gestiona tus contactos profesionales y personales en un solo lugar</div>
    </div>

    <script>
        // Crear círculos flotantes
        document.addEventListener('DOMContentLoaded', function() {
            const container = document.getElementById('floatingContacts');
            const colors = ['rgba(67, 97, 238, 0.1)', 'rgba(76, 201, 240, 0.1)', 'rgba(58, 12, 163, 0.1)'];
            
            for (let i = 0; i < 15; i++) {
                const circle = document.createElement('div');
                circle.classList.add('contact-circle');
                
                // Tamaño aleatorio entre 50 y 200px
                const size = Math.random() * 150 + 50;
                circle.style.width = `${size}px`;
                circle.style.height = `${size}px`;
                
                // Posición aleatoria
                circle.style.left = `${Math.random() * 100}%`;
                circle.style.top = `${Math.random() * 100 + 100}%`;
                
                // Color aleatorio
                circle.style.background = colors[Math.floor(Math.random() * colors.length)];
                
                // Animación con duración aleatoria
                circle.style.animationDuration = `${Math.random() * 20 + 10}s`;
                circle.style.animationDelay = `${Math.random() * 5}s`;
                
                container.appendChild(circle);
            }
        });
    </script>
</body>
</html>
