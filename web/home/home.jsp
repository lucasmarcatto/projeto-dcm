<%-- 
    Document   : home
    Created on : 29 de nov. de 2025, 13:13:15
    Author     : Lucas Marcatto

camisa_bsq_brasil.jpg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home -DC Men Store</title>
    </head>
    <body>
        <%@ include file="/home/app/modulos.jsp" %>
        
        <!-- Inserir lógica de pegar produtos do BD-->
        
        <!-- Produtos -->
        <main class="main-content">
            <div class="products-grid">
                <!-- Produto 1 -->
                <div class="product-card">
                    <div class="product-image">
                        <img src="<%=request.getContextPath()%>/img/camisa_bsq_brasil.jpg" alt="Camiseta Essential Black">
                    </div>
                    <div class="product-info">
                        <h3>Camiseta Essential Black</h3>
                        <p class="price">R$ 89,90</p>
                    </div>
                </div>

            </div>
        </main>
    </body>
</html>
