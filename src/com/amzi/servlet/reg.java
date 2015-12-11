/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amzi.servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amzi.util.DbUtil;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author Alex
 */
@WebServlet("/reg")
public class reg extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String user_id, first_name, last_name, user_email, user_name, user_password;
        user_id = request.getParameter("user_id").toString();
        first_name = request.getParameter("first_name").toString();
        last_name = request.getParameter("last_name").toString();
        user_email = request.getParameter("user_email").toString();
        user_name = request.getParameter("user_name").toString();
        user_password = request.getParameter("user_password").toString();
        Connection conn = DbUtil.getConnection();

        try {

            String sql = "insert into USER values('" + user_id + "','" + first_name + "','" + last_name + "','" + user_email + "','" + user_name + "','" + user_password + "')";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.execute();
            out.println("Registered Succesfully");
            String site = new String("http://192.168.56.1:8080/WEB-INF/gallery.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location",site);

        } catch (Exception e) {
            out.println(e);

        }

    }

}
