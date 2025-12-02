<%@page import="model.TipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String usuarioLogado = (String) session.getAttribute("usuario");
    TipoUsuario tipoUsuarioLogado = (TipoUsuario) session.getAttribute("tipo_usuario");
    boolean logado = false;

    if ((usuarioLogado != null) || (tipoUsuarioLogado != null)) {

        logado = true;

    }
    
    String loginPath = request.getContextPath() + "/home/login.jsp";
    String logoutPath = request.getContextPath() + "/home?task=logout";

%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css"> 

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<nav class="navbar">
    <div class="nav-container">
        <div class="nav-left">
            <div class="logo">
                <a href="<%=request.getContextPath()%>/home/home.jsp"><img src="<%=request.getContextPath()%>/img/logo-dcmen-png.png" alt="Logo DC Men"></a>
                
            </div> 
            <div class="nav-links">
                <% if( logado && tipoUsuarioLogado.getModuloAdm().equals("S") ){%>
                    <a href="<%= request.getContextPath()  %>/home/app/produtos_form.jsp?action=create">Add Produto</a>
                <%}%>
                <% if( logado && (tipoUsuarioLogado.getModuloAdm().equals("S") || tipoUsuarioLogado.getModuloVendas().equals("S") ) ){%>
                    <a href="<%=request.getContextPath()%>/home/app/produtos.jsp">Ver Produtos</a>
                <%}%>
            </div>
        </div>
        <div class="nav-right">
            <a href="<%= logado ? logoutPath : loginPath %>" 
               class="btn-log-in-out"><%= logado ? "Sair" : "Entrar"%></a>
            <button class="btn-user">👤</button>
        </div>
    </div>
</nav>

