package br.com.dao;

import br.com.model.StockModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @author Carlo
 */
public class StockDao {

    private Connection connection;
    private PreparedStatement ps;
    private Statement st;
    private ResultSet rs;
    private ArrayList<StockModel> listStock = new ArrayList<StockModel>();

    public StockDao() {
        connection = new ConnectionFactory().getConnection();
    }
    
    
    //  GET ESTOQUE_ID
    public StockModel getStockId(int produtoId){
        StockModel sm = new StockModel();
        String SQL = "SELECT * FROM TBPRODUTOS WHERE ESTOQUE_ID = ?";
        
        try {
            ps = connection.prepareStatement(SQL);
            ps.setInt(1, produtoId);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                sm.setEstoque_id(rs.getInt("estoque_id"));
                sm.setDescricao(rs.getString("descricao"));
                sm.setCodigo(rs.getString("codigo"));
                sm.setUnidade(rs.getString("unidade"));
                sm.setPreco(rs.getFloat("preco"));
                sm.setEstoque(rs.getInt("estoque"));
            }
            ps.close();
            
        } catch (Exception err) {
            err.printStackTrace();
        }
        return sm;
    }

    //  LIST
    public ArrayList<StockModel> showStock() {
        String SQL = "SELECT * FROM TBPRODUTOS";

        try {
            st = connection.createStatement();
            rs = st.executeQuery(SQL);

            while (rs.next()) {
                listStock.add(new StockModel(rs.getInt("estoque_id"), rs.getString("descricao"), rs.getString("codigo"), rs.getString("unidade"), rs.getFloat("preco"), rs.getInt("estoque")));
            }

        } catch (Exception err) {
            System.out.println("Erro ao Devolver Dados: " + err.getMessage());
        }
        return listStock;
    }
    
    //  LIST GEET DESCRIÇÃO
    public ArrayList<StockModel> showStock(String descricao) {
        String SQL = "SELECT * FROM TBPRODUTOS WHERE DESCRICAO LIKE ?";

        try {
            ps = connection.prepareStatement(SQL);
            ps.setString(1, descricao + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                listStock.add(new StockModel(rs.getInt("estoque_id"), rs.getString("descricao"), rs.getString("codigo"), rs.getString("unidade"), rs.getFloat("preco"), rs.getInt("estoque")));
            }

        } catch (Exception err) {
            System.out.println("Erro ao Devolver Dados: " + err.getMessage());
        }
        return listStock;
    }
    
    
    
    
    

    //  INSERT
    public boolean addProduto(StockModel sm) {
        String SQL = "INSERT INTO TBPRODUTOS(DESCRICAO, CODIGO, UNIDADE, PRECO, ESTOQUE) VALUES(?,?,?,?,?)";

        try {
            ps = connection.prepareStatement(SQL);
            ps.setString(1, sm.getDescricao());
            ps.setString(2, sm.getCodigo());
            ps.setString(3, sm.getUnidade());
            ps.setFloat(4, sm.getPreco());
            ps.setInt(5, sm.getEstoque());

            ps.execute();
            ps.close();
            System.out.println("Cadastrado com Sucesso!");
            return true;
        } catch (Exception err) {
            System.out.println("Ocorreu um erro na inserção: " + err.getMessage());
            return false;
        }
    }
    
    //  UPDATE
    public boolean updateProduto(StockModel sm){
        String SQL = "UPDATE TBPRODUTOS SET DESCRICAO=?, CODIGO=?, UNIDADE=?, PRECO=?, ESTOQUE=? WHERE ESTOQUE_ID = ?";
        
        try {
            ps = connection.prepareStatement(SQL);
            ps.setString(1, sm.getDescricao());
            ps.setString(2, sm.getCodigo());
            ps.setString(3, sm.getUnidade());
            ps.setFloat(4, sm.getPreco());
            ps.setInt(5, sm.getEstoque());
            ps.setInt(6, sm.getEstoque_id());
            
            ps.executeUpdate();
            ps.close();
            return true;
        } catch (Exception err) {
            System.out.println("Falha na Alteração, erro: " + err);
            return false;
        }
    }
    
    //  DELETE
    public boolean deleteProduto(int estoque_id){
        String SQL = "DELETE FROM TBPRODUTOS WHERE ESTOQUE_ID = ?";
        
        try {
            ps = connection.prepareStatement(SQL);
            ps.setInt(1, estoque_id);
            ps.executeUpdate();
            ps.close();
            return true;
            
        } catch (Exception err) {
            System.out.println("Falha ao deletar o produto, erro: " + err);
            return false;
        }
    }
    
}
