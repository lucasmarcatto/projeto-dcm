<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Produtos</title>
        <%@ include file="/home/app/modulos.jsp" %>
    </head>
    <body>
        
        
        
        <% ArrayList<Produto> dados = new Produto().getAllTableEntities(); %>
        
        <!-- Conteúdo Principal -->
        <main class="main-content">
            <h1 class="page-title">Produtos Gerais</h1>

            <div class="table-container">
                <table class="products-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Foto</th>
                            <th>Nome</th>
                            <th>Cor</th>
                            <th>Tamanho</th>
                            <th>Valor</th>
                            <th>Categoria</th>
                            <th>Marca</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for( Produto pd : dados ) { 
                            String imgPath = pd.getCaminhoImg() == null ? request.getContextPath() + "/img/logo-dcmen-png.png" : request.getContextPath() + pd.getCaminhoImg();
                        %>
                            <tr>
                                <td><%= pd.getId()%></td>
                                <td><img src="<%= imgPath%>" alt="<%= pd.getNome()%>" class="product-thumb"></td>
                                <td><%= pd.getNome()%></td>
                                <td><%= pd.getCor()%></td>
                                <td><%= pd.getTamanho()%></td>
                                <td>R$ <%= pd.getValor()%></td>
                                <td><%= pd.getCategoriaId()%></td>
                                <td><%= pd.getMarcaId()%></td>
                                
                                <% if( logado && (tipoUsuarioLogado.getModuloAdm().equals("S") || tipoUsuarioLogado.getModuloVendas().equals("S") ) ){%>
                                    
                                        <td class="actions-cell">
                                            <a href="<%= request.getContextPath()  %>/home/app/produtos_form.jsp?action=update&id=<%= pd.getId()%>">
                                                <button class="btn-edit">Editar</button>
                                            </a>
                                            
                                            <a href="#">
                                                <button class="btn-delete">Excluir</button>
                                            </a>
                                            </td>
                                    
                                <% } %>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </main>
    </body>
</html>
