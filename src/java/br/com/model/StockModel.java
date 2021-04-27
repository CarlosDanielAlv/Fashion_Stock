package br.com.model;

/**
 * @author Carlo
 */
public class StockModel {
    private int estoque_id;
    private String descricao;
    private String codigo;
    private String unidade;
    private float preco;
    private int estoque;

    public StockModel() {
    }
    
    //Usar quando necessário estoque_id
    public StockModel(int estoque_id, String descricao, String codigo, String unidade, float preco, int estoque) {
        this.estoque_id = estoque_id;
        this.descricao = descricao;
        this.codigo = codigo;
        this.unidade = unidade;
        this.preco = preco;
        this.estoque = estoque;
    }

    //Usar quando não necessário estoque_id
    public StockModel(String descricao, String codigo, String unidade, float preco, int estoque) {
        this.descricao = descricao;
        this.codigo = codigo;
        this.unidade = unidade;
        this.preco = preco;
        this.estoque = estoque;
    }

    public int getEstoque_id() {
        return estoque_id;
    }

    public void setEstoque_id(int estoque_id) {
        this.estoque_id = estoque_id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getUnidade() {
        return unidade;
    }

    public void setUnidade(String unidade) {
        this.unidade = unidade;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public int getEstoque() {
        return estoque;
    }

    public void setEstoque(int estoque) {
        this.estoque = estoque;
    }
    
    
    
    
}
