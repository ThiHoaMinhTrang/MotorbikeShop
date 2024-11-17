/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.ProductDAO;
import sample.product.ProductDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SearchMinMaxController2", urlPatterns = {"/SearchMinMaxController2"})
public class SearchMinMaxController2 extends HttpServlet {

    private static final String ERROR = "phoneControl.jsp";
    private static final String SUCCESS = "phoneControl.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String min = request.getParameter("Min price");
            String max = request.getParameter("Max price");
            float minValue, maxValue;
            if (min.isEmpty() && max.isEmpty()) {
                minValue = Float.MIN_VALUE;
                maxValue = Float.MAX_VALUE;
            } else if (min.isEmpty()) {
                minValue = Float.MIN_VALUE;
                maxValue = Float.parseFloat(max);
            } else if (max.isEmpty()) {
                minValue = Float.parseFloat(min);
                maxValue = Float.MAX_VALUE;
            } else {
                minValue = Float.parseFloat(min);
                maxValue = Float.parseFloat(max);
            }
            String brand = request.getParameter("Brand");
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> ProductList = dao.getAllByMinMax3(minValue, maxValue, brand);
            if (ProductList.isEmpty()) {
                ProductList = dao.getAllProduct();
                request.setAttribute("Product_List", ProductList);
                url = SUCCESS;
            } else if (ProductList.size() > 0) {
                request.setAttribute("Product_List", ProductList);
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("Error at SearchCartController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
