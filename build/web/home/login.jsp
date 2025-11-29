<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%  
            String msg = (String) request.getAttribute("msg");
            if ( msg != null ) { %>
            <script>
                alert("<%= msg %>");
            </script>
        <% }%>
        
        <%
            HttpSession sessao = request.getSession(false);
            if( ( sessao != null ) &&
                    ( sessao.getAttribute("usuario") != null )  &&
                    ( sessao.getAttribute("tipo_usuario") != null ) ) {
                response.sendRedirect( request.getContextPath() + "/home/home.jsp" );
            }
        %>
        
        <% 
            int id = -1;
            Cookie[] cookies = request.getCookies();
            if( cookies != null ) {
                for( Cookie c : cookies ) {
                    if( c.getName().equals("id") ) {
                        id = Integer.parseInt( c.getValue() );
                    }
                }
            }
        %>

        <%@ include file="/home/app/modulos.jsp" %>
        
        <main class="login-container">
        <div class="login-box">
            <h1 class="login-title">Login</h1>
            <form class="login-form" action="<%= request.getContextPath()  %>/home?task=login" method="post">
                
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="text" id="id" name="id" pattern="\d+" title="Apenas dígitos" required>
                </div>
                
                <div class="form-group">
                    <label for="senha">Senha:</label>
                    <input type="password" id="senha" name="senha" required>
                </div>
                
                <button type="submit" class="btn-submit">Login</button>
                
            </form>
        </div>
    </main>
        
    </body>
</html>
