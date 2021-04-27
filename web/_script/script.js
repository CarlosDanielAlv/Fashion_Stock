function validarCampos() {
    if (document.formStock.cadDescricao.value === ""
            || document.formStock.cadCodProduto.value === ""
            || document.formStock.cadUnidade.value === ""
            || document.formStock.cadEstoque.value === ""
            || document.formStock.cadPreco.value === ""
            ) {
        $('.alert').alert("Preencha todos os campos!!!");
        return false;
    }
    document.formStock.submit();
}

