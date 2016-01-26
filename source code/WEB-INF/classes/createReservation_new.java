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


public class createReservation_new extends HttpServlet {

   private static final long serialVersionUID = 1L;
   MongoClient mongo;
   
   public void init() throws ServletException{
         // Connect to Mongo DB
      mongo = new MongoClient("localhost", 27017);
   }
   
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      try
      {
        HttpSession session = request.getSession();
        String available_car_id = request.getParameter("available_car_id"); 
        String startDate_string = (String)(session.getAttribute("sStartDate"));
        String endDate_string = (String)(session.getAttribute("sEndDate")); 
        String price_string = request.getParameter("available_car_price"); 
        String car_name = request.getParameter("available_car_name"); 
        int diffInDays = 0; 
        String price_total_string = request.getParameter("price_total_end");
        PrintWriter out = response.getWriter();
        out.println(price_total_string);   
        DB db = mongo.getDB("practice");
        DBCollection reservations = db.getCollection("reservations");
        String uuid = UUID.randomUUID().toString();
        String userName = (String)(session.getAttribute("sUserName"));
        String carCategory = (String)(session.getAttribute("sCategory"));
        BasicDBObject doc = new BasicDBObject("res_id", uuid).
                  append("carCategory", carCategory).
                  append("userName", userName). 
                  append("carID", available_car_id).
                  append("car_name", car_name).
                  append("start_date_string", startDate_string).
                  append("end_date_string", endDate_string).
                  append("price_total", price_total_string).
                  append("status", "reservaton created"); 
          reservations.insert(doc);
          out.println("okay"); 
          response.sendRedirect("index.jsp"); 
      } catch (MongoException e) {
         e.printStackTrace();
      }
   }
   
   public void destroy()   {
      // do nothing.
   }
   
}