<%@page import="model.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Categorias</title>
    </head>
    <body>
        <%@ include file="/home/app/modulos.jsp" %>
        
        <% ArrayList<Categoria> dados = new Categoria().getAllTableEntities(); %>
        
        <!-- Conteúdo Principal -->
        <main class="main-content">
            <h1 class="page-title">Categorias Gerais</h1>

            <div class="table-container">
                <table class="products-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        for( Categoria ct : dados ) {   
                        %>
                            <tr>
                                <td><%= ct.getId()%></td>
                                <td><%= ct.getNome()%></td>
                                
                                <% if( logado && (tipoUsuarioLogado.getModuloAdm().equals("S") || tipoUsuarioLogado.getModuloVendas().equals("S") ) ){%>
                                    
                                        <td class="actions-cell">
                                            <a href="<%= request.getContextPath()  %>/home/app/categorias_form.jsp?action=update&id=<%= ct.getId()%>">
                                                <button class="btn-edit">Editar</button>
                                            </a>
                                            
                                            <a href="<%= request.getContextPath() %>/home?action=delete&id=<%= ct.getId()%>&task=categorias" onclick="return confirm('Deseja realmente excluir a categoria <%= ct.getNome()%> ?')">
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
