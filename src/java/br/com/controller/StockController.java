package br.com.controller;

import br.com.bo.StockBo;
import br.com.model.StockModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Carlo
 */
@WebServlet(name = "StockController", urlPatterns = {"/StockController"})
public class StockController extends HttpServlet {

    private static String INSERT_OR_EDIT = "/stock.jsp";
    private static String LIST_STOCK = "/listStock.jsp";
    private ArrayList<StockModel> listStock = new ArrayList<StockModel>();
    private StockBo sb = new StockBo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String forward = ""; // Recebe a página desejada
        String action = request.getParameter("action"); // Aemazena a ação desejada.
        
        //teste
        String descricao = request.getParameter("cadPesq");
        System.out.println("palavra armazenada: " + descricao);
        
        //  FILTRAR DADOS
        if(descricao != null){
            forward = LIST_STOCK;
            System.out.println("palavra armazenada: " + descricao);
            listStock = sb.showStock(descricao);
            request.setAttribute("arrayStock", listStock);
        }
        
        //  MOSTRAR TODOS os Dados
        else if (action.equalsIgnoreCase("listStock")) {
            forward = LIST_STOCK;
            listStock = sb.showStock();
            request.setAttribute("arrayStock", listStock);
        } 
        
        //  DELETAR Produto
        else if (action.equalsIgnoreCase("delete")) {
            forward = LIST_STOCK;
            int estoque_id = Integer.parseInt(request.getParameter("estoque_id"));
            sb.deleteProduto(estoque_id);

            listStock = sb.showStock();
            request.setAttribute("arrayStock", listStock);
        } 

        //  EDITAR Produto
        else if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            int estoque_id = Integer.parseInt(request.getParameter("estoque_id"));
            StockModel sm = sb.getStockId(estoque_id);
            request.setAttribute("stock", sm);
        } 
        
        //  INSERIR PRODUTO
        else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //  INSERT_OR_EDIT
        String estoque_id = request.getParameter("cadEstoque_id");
        String descricao = request.getParameter("cadDescricao");
        String codigo = request.getParameter("cadCodProduto");
        String unidade = request.getParameter("cadUnidade");
        String preco = request.getParameter("cadPreco");
        String estoque = request.getParameter("cadEstoque");

        if (estoque_id == "" || estoque_id.isEmpty()) {
            sb.addProduto(new StockModel(descricao, codigo, unidade, Float.parseFloat(preco), Integer.parseInt(estoque)));
        }else{
            sb.updateProduto(new StockModel(Integer.parseInt(estoque_id), descricao, codigo, unidade, Float.parseFloat(preco), Integer.parseInt(estoque)));
        }

        listStock = sb.showStock();
        RequestDispatcher view = request.getRequestDispatcher(LIST_STOCK);
        request.setAttribute("arrayStock", listStock);
        view.forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
