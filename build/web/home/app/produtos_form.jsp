<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Produto pd = null;

    String action = request.getParameter("action");
    if (action == null) {
        action = "create";
    } else {
        if (action.equals("update")) {

            int id = Integer.valueOf(request.getParameter("id"));

            pd = new Produto();
            pd.setId(id);
            pd.load();

        }
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= (action.equals("create") ? "Cadastrar" : "Editar")%> Produto</title>
    </head>
    <body>

        <%@ include file="/home/app/modulos.jsp" %>

        <main class="login-container">
            <div class="login-box">
                <h1 class="login-title"><%= (action.equals("create") ? "Cadastrar" : "Editar")%> Produto</h1>
                <form class="login-form" action="<%= request.getContextPath()%>/home?task=login" method="post">

                    <div class="form-group">

                    </div>

                    <div class="form-group">

                    </div>

                    <button type="submit" name="Salvar" value="Salvar" class="btn-submit">Salvar</button>
                    

                </form>
            </div>
        </main>
    </body>
</html>
