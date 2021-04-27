<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html lang="br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <script src="_script/script.js"></script>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <meta name="description" content="">
        <meta name="author" content="Carlos Daniel da Silva">
        <link rel="icon" href="_img/FiveIcon.png"> <!-- FIVE-ICON -->

        <title>Registro - Fashion stock</title>

    </head>

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
            <!-- comment 
            <li class="breadcrumb-item"><a href="Sobre.html">Sobre</a></li>
            -->
            <li class="breadcrumb-item"><a href="home.html">Home</a></li>
            <li class="breadcrumb-item"><a href="StockController?action=listStock">Lista</a></li>
            <li class="breadcrumb-item active" aria-current="page">Registro</li>
        </ol>
    </nav>

    <a style="margin-right: 80%" class="btn btn-secondary btn-sm"
       href="StockController?action=listStock">Voltar</a>


    <!-- TÍTULO PÁGINA -->
    <div class="container">
        <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="_img/LogoMaior.png" alt="" width="72" height="72">
            <h2>Formulário de Registro</h2>
            <p class="lead">
                Preencha todos os campos obrigatórios para realizar um novo registro de ítens.
            </p>
        </div>
    </div>

    <!-- FORMULÁRIO DE CADASTRO -->
    <div class="container" style="width: 45%">
        <h4 class="mb-3">Produto</h4> <!-- Título do FORM -->

        <form name="formStock" id="formStock" method="POST" action="StockController">

            <div class="mb-3">
                <input type="text" readonly="readonly" class="form-control-plaintext" name="cadEstoque_id" value="<c:out value="${stock.getEstoque_id()}" />" /> 
            </div>

            <div class="row"><!-- DESCRIÇÃO -->
                <div class="col-md-6 mb-3">
                    <label>Descrição</label>
                    <input type="text" class="form-control" name="cadDescricao" id="cadDescricao" placeholder="Camiseta polo" value="<c:out value="${stock.getDescricao()}" />" /> 
                </div>

                <div class="col-md-6 mb-3">
                    <label>Código do Produto</label>
                    <input type="text" class="form-control" name="cadCodProduto" id="cadCodProduto" placeholder="#camPolo" value="<c:out value="${stock.getCodigo()}" />" /> 
                </div>
            </div>

            <div class="mb-3"><!-- UNIDADE -->
                <label>Unidade *</label>
                <input type="number" class="form-control" placeholder="3" name="cadUnidade" id="cadUnidade" value="<c:out value="${stock.getUnidade()}" />" /> 
            </div>

            <div class="mb-3"><!-- ESTOQUE -->
                <label>Estoque *</label>
                <input type="number" class="form-control" placeholder="10" name="cadEstoque" id="cadEstoque" value="<c:out value="${stock.getEstoque()}" />" /> 
            </div>

            <div class="mb-3"><!-- PREÇO -->
                <label>Preço *</label>
                <input type="number" class="form-control" placeholder="100.00" name="cadPreco" id="cadPreco" value="<c:out value="${stock.getPreco()}" />" /> 
            </div>

            <hr class="mb-4">

            <button class="btn btn-info btn-lg btn-block" type="submit" onclick="validarCampos()">Realizar Registro</button>

            <div id="alertErro" class="alert alert-danger" role="alert">Preencha todos os Campos!!</div>
            <div id="alertOk" class="alert alert-danger" role="alert">Cadastro Realizado!!</div>
        </form>
    </div>
    <!-- FORMULÁRIO DE CADASTRO -->



    <!-- RODAPÉ -->
    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">© 2021 Carlos Daniel</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="">Privacidade</a></li>
            <li class="list-inline-item"><a href="">Termos</a></li>
            <li class="list-inline-item"><a href="">Suporte</a></li>
        </ul>
    </footer>
    <!-- RODAPÉ -->


    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


    <!-- VALIDAÇÃO DE PREENCHIMENTO -->
    <script>
                $(document).ready(function () {
                    $("#alertErro").hide();
                    $("#alertOk").hide();
                    $("#formStock").submit(function (e) {
                        e.preventDefault();
                        cadCodProduto = $.trim($("#cadCodProduto").val());
                        cadUnidade = $.trim($("#cadUnidade").val());
                        cadEstoque = $.trim($("#cadEstoque").val());
                        cadPreco = $.trim($("#cadPreco").val());
                        if (cadCodProduto.length === 0 && cadUnidade.length === 0 && cadEstoque.length === 0 && cadPreco.length === 0) {
                            $("#alertErro").fadeTo(2000, 500).slideUp(500, function () {
                                $("#alertErro").slideUp(500);
                            });
                        }
                    });
                });
    </script>  
</body>
</html>
