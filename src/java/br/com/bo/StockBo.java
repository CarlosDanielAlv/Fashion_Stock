package br.com.bo;

import br.com.dao.StockDao;
import br.com.model.StockModel;
import java.util.ArrayList;

/**
 * @author Carlo
 */
public class StockBo {
    
    //  GET PRODUTO
    public ArrayList<StockModel> showStock(String descricao) {
        StockDao sd = new StockDao();
        
        return sd.showStock(descricao);
    }
    
    //  GET ESTOQUE_ID
    public StockModel getStockId(int produtoId){
        StockDao sd = new StockDao();
        
        return sd.getStockId(produtoId);
    }
    
    //  LIST
    public ArrayList<StockModel> showStock() {
        StockDao sd = new StockDao();
        
        return sd.showStock();
    }
    
    //  INSERT
    public boolean addProduto(StockModel sm){
        StockDao sd = new StockDao();
        
        return sd.addProduto(sm);
    }
    
    //  UPDATE
    public boolean updateProduto(StockModel sm){
        StockDao sd = new StockDao();
        
        return sd.updateProduto(sm);
    }
    
    //  DELETE
    public boolean deleteProduto(int estoque_id){
        StockDao sd = new StockDao();
        
        return sd.deleteProduto(estoque_id);
    }
    
}
