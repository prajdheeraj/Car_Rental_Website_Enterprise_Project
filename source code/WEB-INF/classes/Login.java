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

import java.io.IOException;  
import java.io.PrintWriter;  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;   


public class Login extends HttpServlet {

   private static final long serialVersionUID = 1L;
   MongoClient mongo;
   
   public void init() throws ServletException{
         // Connect to Mongo DB
      mongo = new MongoClient("localhost", 27017);
   }
   
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      try
      {
         String n = request.getParameter("userName");
         String p = request.getParameter("password");

         // If database doesn't exists, MongoDB will create it for you
         DB db = mongo.getDB("practice");
         BasicDBObject query = new BasicDBObject();
         query.put("username", n);
         query.put("password", p);
         // If the collection does not exists, MongoDB will create it for you
         DBCollection loindet = db.getCollection("loindet");
         // collection selected successfully. 
         DBCursor cursor = loindet.find(query);  
         //int cnt = 0; 
         int cnt = loindet.find(query).count(); 
         if(cnt!=0)
         {
             PrintWriter out = response.getWriter();
             //out.println("okay");
             HttpSession session = request.getSession();
             session.setAttribute( "sUserName", n );
             response.sendRedirect("index.jsp");
         }

         if(cnt == 0)
         {
            response.sendRedirect("login.jsp"); 
         }
      } catch (MongoException e) {
         e.printStackTrace();
      }
   }
   
   public void destroy()   {
      // do nothing.
   }
   
}