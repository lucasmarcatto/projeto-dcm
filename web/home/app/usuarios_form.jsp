<%-- 
    Document   : usuario_form
    Created on : 24 de nov. de 2025, 20:53:49
    Author     : Lucas Marcatto
--%>

<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario us = null;

    String action = request.getParameter("action");
    if (action == null) {
        action = "create";
    } else {
        if (action.equals("update")) {

            int id = Integer.valueOf(request.getParameter("id"));

            us = new Usuario();
            us.setId(id);
            us.load();

        }
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= (action.equals("create") ? "Cadastrar" : "Editar")%> Usuário</title>
    </head>
    <body>
        <h1><%= (action.equals("create") ? "Cadastrar" : "Editar")%> Usuário</h1>

        <form action="<%= request.getContextPath()%>/home?action=<%= action%>&task=usuarios" method="post">

            <label for="id">Id:</label>
            <input type="text" id="id" name ="id" pattern="\d+" title="Apenas números" value="<%= (us != null) ? us.getId() : ""%>" <%= (us != null) ? "readonly" : ""%> required><br/>   

            <label for="nome">Nome:</label>
            <input type="text" id="nome" name ="nome" value="<%= ((us != null) && (us.getNome() != null)) ? us.getNome() : ""%>" required><br/>

            <label for="email">E-mail:</label>
            <input type="text" id="email" name ="email" pattern="^[^\s@]+@[^\s@]+\.[^\s@]+$" title="Insira um e-mail válido" value="<%= ((us != null) && (us.getEmail()!= null)) ? us.getEmail() : ""%>" required><br/>
          
            <label for="telefone">Telefone:</label>
            <input type="text" id="telefone" name ="telefone" pattern="^\([0-9]{2}\)\s?[0-9]{4,5}-[0-9]{4}$" title="Formato aceito: (xx)xxxx-xxxx ou (xx)xxxxx-xxxx" value="<%= ((us != null) && (us.getTelefone() != null)) ? us.getTelefone() : ""%>"><br/>

            <label for="tipo_usuario_id">Tipo Usuário ID:</label>
            <input type="text" id="tipo_usuario_id" name ="tipo_usuario_id" pattern="\d+" title="apenas dígitos" value="<%= ((us != null)) ? us.getTipoUsuarioId() : ""%>" required><br/>

            <label for="senha">Senha:</label>
            <input type="password" id="senha" name ="senha" value="<%= ((us != null)) ? us.getSenha() : ""%>" required><br/>
            
            <input type="submit" name="Salvar" value="Salvar"> 
        </form>
    </body>
</html>
