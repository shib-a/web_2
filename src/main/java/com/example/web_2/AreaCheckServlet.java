package com.example.web_2;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;

public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            handleRequest(request, response);
        }catch (ServletException | IOException e){}
    }
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //var params = request.getParameterMap();
        var x = Double.parseDouble(request.getParameter("x_data"));
        var y = Double.parseDouble(request.getParameter("y_data"));
        var r = Double.parseDouble(request.getParameter("r_data"));
        var hit =  validate(x,y,r);
        var ans = formAnswer(x, y, r, hit);
        request.setAttribute("json", ans);
        request.getRequestDispatcher("src/main/webapp/result.jsp").forward(request, response);
    }
    public boolean validate(double x, double y, double r){return checkTriangle(x,y,r) || checkRectangle(x,y,r) || checkCircle(x,y,r);}
    public boolean checkTriangle(double x, double y, double r){
        return (x <= 0 && y >= 0 && x >= -r/2 && x - y + r >= 0);
    }
    public boolean checkRectangle(double x, double y, double r){
        return (y>=-r && x<r/2 && x>=0 && y<=0);
    }
    public boolean checkCircle(double x, double y, double r){
        return (Math.pow(x, 2) + Math.pow(y,2) < Math.pow(r,2) && x<=0 && y<=0);
    }
    public JsonObject formAnswer(double x, double y, double r, boolean hit){
        var g = new Gson();
        var json = new HashMap<String, Object>();
        json.put("x", x);
        json.put("y", y);
        json.put("r", r);
        json.put("hit", hit);
        return g.fromJson(g.toJson(json), JsonObject.class);
    }
//    double calcArea(double x, double y, double r){
//        Math.abs((x*y + x3*(y1-y2))/2.0)
//    }
}
