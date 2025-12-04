<%@page import="model.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Categoria ct = null;

    String action = request.getParameter("action");
    if (action == null) {
        action = "create";
    } else {
        if (action.equals("update")) {

            int id = Integer.valueOf(request.getParameter("id"));

            ct = new Categoria();
            ct.setId(id);
            ct.load();

        }
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= (action.equals("create") ? "Cadastrar" : "Editar")%> Categoria</title>
    </head>
    <body>
        <%@ include file="/home/app/modulos.jsp" %>
        
        <main class="login-container">
            <div class="login-box">
                
                <h1 class="login-title"><%= (action.equals("create") ? "Cadastrar" : "Editar")%> Categoria</h1>
                
                <form action="<%= request.getContextPath()%>/home?action=<%= action%>&task=categorias" method="post">

                    <div class="form-group">
                        <label for="id">Id:*</label>
                        <input type="text" id="id" name ="id" pattern="\d+" title="Apenas números" value="<%= (ct != null) ? ct.getId() : ""%>" <%= (ct != null) ? "readonly" : ""%> required><br/>   
                    </div>

                    <div class="form-group">
                        <label for="nome">Nome:*</label>
                        <input type="text" id="nome" name ="nome" value="<%= ((ct != null) && (ct.getNome() != null)) ? ct.getNome() : ""%>" required><br/>
                    </div>

                    <button type="submit" name="Salvar" value="Salvar" class="btn-submit">Salvar</button>

                </form>
            </div>
        </main>
                    
    </body>
</html>
