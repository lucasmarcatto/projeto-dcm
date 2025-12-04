<%@page import="java.util.ArrayList"%>
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
        
        <%@ include file="/home/app/modulos.jsp" %>
        
        <main class="login-container">
            <div class="login-box">
                <h1 class="login-title"><%= (action.equals("create") ? "Cadastrar" : "Editar")%> Usuário</h1>
                <form action="<%= request.getContextPath()%>/home?action=<%= action%>&task=usuarios" method="post">

                    <div class="form-group">
                        <label for="id">Id:</label>
                        <input type="text" id="id" name ="id" pattern="\d+" title="Apenas números" value="<%= (us != null) ? us.getId() : ""%>" <%= (us != null) ? "readonly" : ""%> required><br/>   
                    </div>

                    <div class="form-group">
                        <label for="nome">Nome:*</label>
                        <input type="text" id="nome" name ="nome" value="<%= ((us != null) && (us.getNome() != null)) ? us.getNome() : ""%>" required><br/>
                    </div>

                    <div class="form-group">
                        <label for="email">E-mail:*</label>
                        <input type="text" id="email" name ="email" pattern="^[^\s@]+@[^\s@]+\.[^\s@]+$" title="Insira um e-mail válido" value="<%= ((us != null) && (us.getEmail() != null)) ? us.getEmail() : ""%>" required><br/>

                    </div>

                    <div class="form-group">
                        <label for="telefone">Telefone:</label>
                        <input type="text" id="telefone" name ="telefone" pattern="^\([0-9]{2}\)\s?[0-9]{4,5}-[0-9]{4}$" title="Formato aceito: (xx)xxxx-xxxx ou (xx)xxxxx-xxxx" value="<%= ((us != null) && (us.getTelefone() != null)) ? us.getTelefone() : ""%>"><br/>
                    </div>

                    <div class="form-group">
                        <label for="tipo_usuario_id">Tipo Usuário:*</label>
                        
                        <select id="tipo_usuario_id" name ="tipo_usuario_id">
                            <%
                            ArrayList<TipoUsuario> dados = new TipoUsuario().getAllTableEntities();
                            for (TipoUsuario tp : dados){
                            %>
                            <option value="<%= tp.getId()%>">
                                <%= tp.getNome()%>
                            </option>
                            <%}%>
                        </select><br/>
                    </div>

                    <div class="form-group">
                        <label for="senha">Senha:*</label>
                        <input type="password" id="senha" name ="senha" value="<%= ((us != null)) ? us.getSenha() : ""%>" required><br/>

                    </div>

                    <button type="submit" name="Salvar" value="Salvar" class="btn-submit">Salvar</button>

                </form>
            </div>
        </main>
</body>
</html>
