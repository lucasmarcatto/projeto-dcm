<%@page import="model.Marca"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.ArrayList"%>
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
                <form class="login-form" action="<%= request.getContextPath()%>/home?action=<%= action%>&task=produtos" method="post">

                    <div class="form-group">
                        <label for="id">Id:*</label>
                        <input type="text" id="id" name ="id" pattern="\d+" title="Apenas números" value="<%= (pd != null) ? pd.getId() : ""%>" <%= (pd != null) ? "readonly" : ""%> required><br/>                       
                    </div>

                    <div class="form-group">
                        <label for="nome">Nome:*</label>
                        <input type="text" id="nome" name ="nome" value="<%= ((pd != null) && (pd.getNome() != null)) ? pd.getNome() : ""%>" required><br/>
                    </div>
                    
                    <div class="form-group">
                        <label for="cor">Cor:*</label>
                        <input type="text" id="cor" name ="cor" value="<%= ((pd != null) && (pd.getCor()!= null)) ? pd.getCor() : ""%>" required><br/>
                    </div>
                    
                    <div class="form-group">
                        <label for="tamanho">Tamanho:*</label>
                        <input type="text" id="tamanho" name ="tamanho" value="<%= ((pd != null) && (pd.getTamanho()!= null)) ? pd.getTamanho(): ""%>" required><br/>
                    </div>
                    
                    <div class="form-group">
                        <label for="valor">Valor:*</label>
                        <input type="number" step="any" id="valor" name ="valor" title="Apenas dígitos" value="<%= (pd != null) ? pd.getValor(): ""%>"required><br/>
                    </div>
                    
                    <div class="form-group">
                        <label for="caminho_img">Nome da Imagem salva (pasta/nome.ext):</label>
                        <input type="text" id="caminho_img" name ="caminho_img" value="<%= ((pd != null) && (pd.getCaminhoImg()!= null)) ? pd.getCaminhoImg(): ""%>" ><br/>
                    </div>
                    
                    <div class="form-group">
                        <label for="categoria_id">Categoria:*</label>
                    
                        <select id="categoria_id" name ="categoria_id" required>
                            <%
                            ArrayList<Categoria> dadosCategoria = new Categoria().getAllTableEntities();
                            int categoriaAtualId = (pd != null) ? pd.getCategoriaId() : 0;
                            
                            for (Categoria ct : dadosCategoria){
                            %>
                            <option value="<%= ct.getId()%>" <%= (ct.getId() == categoriaAtualId) ? "selected" : "" %>>
                                <%= ct.getNome()%>
                            </option>
                            <%}%>
                        </select><br/>
                        
                    </div>
                    
                    <div class="form-group">                       
                        <label for="marca_id">Marca:*</label>
                    
                        <select id="marca_id" name ="marca_id" required>
                            <%
                            ArrayList<Marca> dadosMarca = new Marca().getAllTableEntities();
                            int marcaAtualId = (pd != null) ? pd.getCategoriaId() : 0;
                            
                            for (Marca mc : dadosMarca){
                            %>
                            <option value="<%= mc.getId()%>" <%= (mc.getId() == marcaAtualId) ? "selected" : "" %>>
                                <%= mc.getNome()%>
                            </option>
                            <%
                            }
                            %>
                        </select><br/>
                    </div>

                    <button type="submit" name="Salvar" value="Salvar" class="btn-submit">Salvar</button>
                    

                </form>
            </div>
        </main>
    </body>
</html>
