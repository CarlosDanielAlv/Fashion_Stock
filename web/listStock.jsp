<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <meta name="description" content="listaEstoque">
        <meta name="author" content="Carlos Daniel da Silva">
        <link rel="icon" href="_img/FiveIcon.png"> <!-- FIVE-ICON -->

        <title>ListaEstoque - Fashion stock</title>

    </head>
    <body>
    <body class="text-center">

        <!-- CABEÇALHO -->
        <nav class="navbar navbar-dark bg-dark"><!-- Imagem e texto -->
            <a class="navbar-brand" href="home.html">
                <img src="_img/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
                Fashion Stock
            </a>

            <!-- Menu -->
            <div style="justify-content: space-between; margin: 0 30px;">
                <a class="badge badge-pill badge-dark" href="home.html"><font size=3>Home</font></a>
                <a class="badge badge-pill badge-dark" href="StockController?action=listStock"><font size=3>Lista Estoque</font></a>
                <a class="badge badge-secondary badge-dark" href="StockController?action=insert"><font size=3>Registro</font></a>
            </div>
            <!-- Menu -->
        </nav>

        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="home.html">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Estoque</li>
            </ol>
        </nav>


        <!-- TÍTULO PÁGINA -->
        <div class="container">
            <div class="py-5 text-center">
                <img class="d-block mx-auto mb-4" src="_img/LogoMaior.png" alt="" width="50" height="50">
                <h3>Lista de Produtos</h3>
                <p class="lead">
                    Confira todos os itens disponíveis em seu estoque.<br>
                </p>
            </div>
        </div>
        
        <p style="margin-left: 75%"><font size=2 color="#Dfe1e1">Para listar todos os itens, basta pesquisar branco </font></p>

        <!-- FORM DE PESQUISA -->
        <nav class="navbar navbar-light bg-light">
            <a class="btn btn-info" href="StockController?action=insert"
               role="button">Novo Produto</a>

            <form class="form-inline" method="GET" action="StockController">
                <input class="form-control mr-sm-2" type="text" name="cadPesq" placeholder="Pesquisar">
                <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Pesquisar</button>
            </form>
        </nav>

        <!-- TABELA ESTOQUE -->
        <table class="table">

            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Descrição</th>
                    <th scope="col">Código do Produto</th>
                    <th scope="col">Unidade</th>
                    <th scope="col">Preço</th>
                    <th scope="col">Estoque</th>
                    <th scope="col">Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${arrayStock}" var="stock">
                    <tr>
                        <td><c:out value="${stock.getEstoque_id()}" /></td>
                        <td><c:out value="${stock.getDescricao()}" /></td>
                        <td><c:out value="${stock.getCodigo()}" /></td>
                        <td><c:out value="${stock.getUnidade()}" /></td>
                        <td>R$ <c:out value="${stock.getPreco()}" /></td>
                        <td><c:out value="${stock.getEstoque()}" /></td>

                        <td><a class="btn btn-secondary btn-sm"
                               href="StockController?action=edit&estoque_id=<c:out value ="${stock.getEstoque_id()}"/>">Editar</a>
                            <a class="btn btn-danger btn-sm"
                               href="StockController?action=delete&estoque_id=<c:out value ="${stock.getEstoque_id()}"/>">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!<!-- TABELA ESTOQUE -->

        <!-- RODAPÉ -->
        <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mb-1"  style="margin-top: 10%">© 2021 Carlos Daniel</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="https://api.whatsapp.com/send?phone=5561995004992&text=Ol%C3%A1%20preciso%20de%20suporte%20com%20seu%20website%20-%20Fashion%20Stock">Privacidade</a></li>
                <li class="list-inline-item"><a href="https://api.whatsapp.com/send?phone=5561995004992&text=Ol%C3%A1%20preciso%20de%20suporte%20com%20seu%20website%20-%20Fashion%20Stock">Termos</a></li>
                <li class="list-inline-item"><a href="https://api.whatsapp.com/send?phone=5561995004992&text=Ol%C3%A1%20preciso%20de%20suporte%20com%20seu%20website%20-%20Fashion%20Stock">Suporte</a></li>
            </ul>
        </footer>
        <!-- RODAPÉ -->

    </body>
</html>
