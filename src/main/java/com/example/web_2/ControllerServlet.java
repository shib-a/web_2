package com.example.web_2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("im in controller");
//        System.out.println(request.getParameter("x_data"));
        handleRequest(request, response);
    }
    public void handleRequest(HttpServletRequest request, HttpServletResponse response){
        try {
            if (request.getParameter("x_data") == null || request.getParameter("y_data") == null || request.getParameter("r_data") == null) {
                handleException(new InvalidDataException("invalid data"));
            }

            response.sendRedirect("./areaCheck?"+request.getQueryString());
//            var dispatcher = request.getRequestDispatcher("AreaCheckServlet");
//            dispatcher.forward(request, response);
        }catch (RuntimeException  | IOException e){handleException(e);}
    }
    public void handleException(Exception e){
        e.printStackTrace();
    }
}
