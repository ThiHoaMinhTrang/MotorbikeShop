package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "createAccount.jsp";
    private static final String SUCCESS = "createAccount.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserDAO dao = new UserDAO();
        UserError userError = new UserError();
        String action = request.getParameter("action");
        if (action == null) 
            action = "";

        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullname");
            String role = "US";
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");

            boolean checkValidation = true;
            if (userID.length() > 20 || userID.length() < 2) {
                userError.setUserId("User ID should have 2 - 20 characters!");
                checkValidation = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(userID);
            if (checkDuplicate) {
                userError.setUserId("Duplicate userID!");
                checkValidation = false;
            }
            if (fullName.length() > 50 || fullName.length() < 2) {
                userError.setFullName("Full Name should have 2 - 50 characters!");
                checkValidation = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirm("Passwords didn’t match. Try again!");
                checkValidation = false;
            }
            if (checkValidation) {
                UserDTO user = new UserDTO(fullName, userID, password, role);
                boolean checkInsert = dao.insertV2(user);
                if (checkInsert) {
                    url = SUCCESS;
                    request.setAttribute("SUCCESS", "Create your account successfully!");
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserId("Id has existed!");
                request.setAttribute("USER_ERROR", userError);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
