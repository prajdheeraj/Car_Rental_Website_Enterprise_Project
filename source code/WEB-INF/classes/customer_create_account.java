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
            
public class customer_create_account extends HttpServlet {
   
   private static final long serialVersionUID = 1L;
   MongoClient mongo;
   
   public void init() throws ServletException{
         // Connect to Mongo DB
      mongo = new MongoClient("localhost", 27017);
   }
   
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
      try{
         //Get the values from the form
         String name = request.getParameter("name");

         String username = request.getParameter("username");
         String password = request.getParameter("password");
                              
         // If database doesn't exists, MongoDB will create it for you
         DB db = mongo.getDB("practice");
            
         // If the collection does not exists, MongoDB will create it for you
         DBCollection loindet = db.getCollection("loindet");
         System.out.println("Collection loindet selected successfully");
            
         BasicDBObject doc = new BasicDBObject("title", "loindet").
            append("name", name).
            append("username", username).
            append("password", password);
                           
         loindet.insert(doc);
            
         System.out.println("Document inserted successfully");
         
         //Send the response back to the JSP
         PrintWriter out = response.getWriter();
                  
         out.println("<html>");
         out.println("<head> </head>");
         out.println("<body>");
         out.println("<h1> Login details created for:"+ name + "</h1>");
         
         out.println("<table>");
         
         out.println("<tr>");
         out.println("<td>");
         out.println("<a href='index.html'> Index </a>");
         out.println("</td>");
         out.println("</tr>");
         
         
         
      } catch (MongoException e) {
         e.printStackTrace();
      }
   }
   
   public void destroy()   {
      // do nothing.
   }
   
}