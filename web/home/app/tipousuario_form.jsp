<%@page import="model.TipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    TipoUsuario tp = null;

    String action = request.getParameter("action");
    if (action == null) {
        action = "create";
    } else {
        if (action.equals("update")) {

            int id = Integer.valueOf(request.getParameter("id"));

            tp = new TipoUsuario();
            tp.setId(id);
            tp.load();

        }
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= (action.equals("create") ? "Cadastrar" : "Editar")%> Tipo de Usuário</title>
    </head>
    <body>
        <%@ include file="/home/app/modulos.jsp" %>
        
        <main class="login-container">
            <div class="login-box">
                
                <h1 class="login-title"><%= (action.equals("create") ? "Cadastrar" : "Editar")%> Tipo de Usuário</h1>
                
                <form action="<%= request.getContextPath()%>/home?action=<%= action%>&task=tipousuario" method="post">

                    <div class="form-group">
                        <label for="id">Id:*</label>
                        <input type="text" id="id" name ="id" pattern="\d+" title="Apenas números" value="<%= (tp != null) ? tp.getId() : ""%>" <%= (tp != null) ? "readonly" : ""%> required><br/>   
                    </div>

                    <div class="form-group">
                        <label for="nome">Nome:*</label>
                        <input type="text" id="nome" name ="nome" value="<%= ((tp != null) && (tp.getNome() != null)) ? tp.getNome() : ""%>" required><br/>
                    </div>
                    
                    <div class="checkbox-group">
                        <input type="checkbox" id="modulo_adm" name="modulo_adm" value="S" <%= ( ( tp != null ) && ( tp.getModuloAdm().equals("S") ) ) ? "checked" : "" %> >
                        <label for="modulo_adm">Administrativo</label>
                    </div>
                        
                    <div class="checkbox-group">
                        <input type="checkbox" id="modulo_vendas" name="modulo_vendas" value="S" <%= ( ( tp != null ) && ( tp.getModuloVendas().equals("S") ) ) ? "checked" : "" %> >
                        <label for="modulo_vendas">Vendas</label>
                    </div>
                        
                    <div class="checkbox-group">
                        <input type="checkbox" id="modulo_compras" name="modulo_compras" value="S" <%= ( ( tp != null ) && ( tp.getModuloCompras().equals("S") ) ) ? "checked" : "" %> >
                        <label for="modulo_vendas">Compras</label>
                    </div>

                    <button type="submit" name="Salvar" value="Salvar" class="btn-submit">Salvar</button>

                </form>
            </div>
        </main>
                    
    </body>
</html>
