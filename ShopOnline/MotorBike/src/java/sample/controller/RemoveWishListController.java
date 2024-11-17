///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package sample.controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import sample.product.CartDTO;
//import sample.product.ProductDAO;
//import sample.user.UserDTO;
//
///**
// *
// * @author ADMIN
// */
//@WebServlet(name = "RemoveWishListController", urlPatterns = {"/RemoveWishListController"})
//public class RemoveWishListController extends HttpServlet {
//
//    private static final String ERROR = "SearchWishListController";
//    private static final String SUCCESS = "SearchWishListController";
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        String url = ERROR;
//        try {
//            String mbId = request.getParameter("id");
//            HttpSession session = request.getSession();
//            ProductDAO dao = new ProductDAO();
//            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
//            boolean checkDelete = dao.deleteWishList(mbId, loginUser.getUserId());
//            if (checkDelete) {
//                url = SUCCESS;
//            } else {
//                request.setAttribute("ERROR", "Delete fail!");
//            }
//
//        } catch (Exception e) {
//            log("Error at DeleteController: " + e.toString());
//        } finally {
//            request.getRequestDispatcher(url).forward(request, response);
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}