package com.ajax;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.Iterator;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.util.*; 
import java.io.IOException;  
import java.io.PrintWriter;  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;
import java.text.*; 
import java.io.*; 

/**
 *
 * @author nbuser
 */
public class AutoCompleteServlet extends HttpServlet {

    private ServletContext context;


    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        StringBuffer sb = new StringBuffer();

        boolean prodsAdded = false;
        if (action.equals("complete")) 
        {

            // check if user sent empty string
            if (!targetId.equals("")) 
            {

                        MongoClient mongo;
                        
                            // Connect to Mongo DB
                            mongo = new MongoClient("localhost", 27017);
                        
                        DB db = mongo.getDB("practice");
                        DBCollection cars = db.getCollection("cars");
                        BasicDBObject whereQuery = new BasicDBObject();
                        whereQuery.put("car_name", new BasicDBObject("$regex", targetId)); 
                        DBCursor cursor_car = cars.find(whereQuery);
                        int id = 1; 
                        String linkDetails = ""; 
                        while(cursor_car.hasNext())
                        {
                            BasicDBObject bobj = (BasicDBObject) cursor_car.next();
                            String car_name = ( bobj.getString("car_name"));
                            String car_category = ( bobj.getString("car_category")).trim();
                            if(car_category.equals("Compact Car"))
                                linkDetails = "cars_available_new.jsp?car_category=Compact%20Car";
                            else if(car_category.equals("Standard Car"))
                                linkDetails = "cars_available_new.jsp?car_category=Standard%20Car";
                            else if(car_category.equals("Sedan Car"))
                                linkDetails = "cars_available_new.jsp?car_category=Sedan%20Car";
                            else if(car_category.equals("SUV Car"))
                                linkDetails = "cars_available_new.jsp?car_category=SUV%20Car";


                            sb.append("<product>");
                            sb.append("<id>" + id + "</id>");
                            sb.append("<productTitle>" + car_name + "</productTitle>");
                            sb.append("<linkDetails>" + linkDetails + "</linkDetails>");                        
                            sb.append("</product>");
                            prodsAdded = true;
                            id++;
                        }    
                    
                
            }

            if (prodsAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<products>" + sb.toString() + "</products>");
            } else {
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }

    }
}
