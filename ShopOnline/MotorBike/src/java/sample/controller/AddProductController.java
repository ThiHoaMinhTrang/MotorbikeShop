/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.product.ProductError;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
public class AddProductController extends HttpServlet {

    private static final String ERROR = "createProduct.jsp";
    private static final String SUCCESS = "createProduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductDAO dao = new ProductDAO();
        ProductError error = new ProductError();
        try {
            String iId = request.getParameter("id");
            String iName = request.getParameter("name");
            float price = Float.parseFloat(request.getParameter("price"));
            String brand = request.getParameter("brand");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String image = request.getParameter("image");
            int discount = Integer.parseInt(request.getParameter("discount"));
            boolean checkValidation = true;
            if (iId.length() > 10 || iId.length() < 2) {
                error.setItemId("Mobile ID should have 2 - 50 characters!");
                checkValidation = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(iId);
            if (checkDuplicate) {
                error.setItemId("Duplicate Mobile ID!");
                checkValidation = false;
            }
//            if (description.length() > 250 || description.length() < 2) {
//                error.setDescription("Description should have 2 - 250 characters!");
//                checkValidation = false;
//            }
            if (iName.length() > 20 || iName.length() < 2) {
                error.setItemName("Mobile name should have 2 - 20 characters!");
                checkValidation = false;
            }
            if (checkValidation) {
                ProductDTO product = new ProductDTO(iId, iName, brand, price, quantity, image, discount);
//                boolean checkInsert= dao.insert(user);
                boolean checkInsert = dao.createProduct(product);
                if (checkInsert) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", error);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                error.setItemId("Id has existed!");
                request.setAttribute("PRODUCT_ERROR", error);
            }

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
