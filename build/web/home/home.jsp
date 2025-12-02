<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home - DC Men Store</title>
    </head>
    <body>
        <%@ include file="/home/app/modulos.jsp" %>

        <% ArrayList<Produto> dados = new Produto().getAllTableEntities(); %>

        <!-- Produtos -->
        <main class="main-content">
            <% if (logado && tipoUsuarioLogado.getModuloAdm().equals("S")) {%>
                <a href="<%= request.getContextPath()  %>/home/app/produtos_form.jsp?action=create">
                    <div class="add-product-section">
                        <button class="btn-add-product">+ Adicionar Produto</button>
                    </div>
                </a>
            <%}%>
            <div class="products-grid">
                <!-- Produto 1 -->
                <% for (Produto pd : dados) { 
                    String imgPath = pd.getCaminhoImg() == null ? request.getContextPath() + "/img/logo-dcmen-png.png" : request.getContextPath() + pd.getCaminhoImg();
                %>
                    <div class="product-card">
                        <div class="product-image">
                            <img src="<%=imgPath%>" alt="<%= pd.getNome()%>">
                        </div>
                        <div class="product-info">
                            <h3><%= pd.getNome()%> - <%= pd.getTamanho()%> </h3>
                            <p class="price">R$ <%= pd.getValor()%></p>
                        </div>
                    </div>
                <% }%>        
            </div>
        </main>

    </body>
</html>
