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
public class createReservation extends HttpServlet {

   private static final long serialVersionUID = 1L;
   MongoClient mongo;
   
   public void init() throws ServletException{
         // Connect to Mongo DB
      mongo = new MongoClient("localhost", 27017);
   }
   
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      try
      {
        int l = 0; 
        int k = 0; 
        //String carID = request.getParameter("reservation"); 
        String carCategory = request.getParameter("carCategory"); 
        String carID = request.getParameter("carID"); 
        String start_date_string = request.getParameter("startDate"); 
        String end_date_string = request.getParameter("endDate");
        // String start_time_string = request.getParameter("startTime"); 
        // String end_time_string = request.getParameter("endTime"); 
        //start_date_string = start_date_string + start_time_string; 
        //end_date_string = end_date_string + end_time_string; 

        PrintWriter out = response.getWriter();
        out.println(start_date_string); 
        try 
        {
          Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse((start_date_string).trim());
          Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse((end_date_string).trim());
         //Date startDate = new SimpleDateFormat("yyyy-MM-ddhh:mm").parse((start_date_string).trim());
         //Date endDate = new SimpleDateFormat("yyyy-MM-ddhh:mm").parse((end_date_string).trim());
         int diffInDays = (int)( (startDate.getTime() - endDate.getTime()) 
                 / (1000 * 60 * 60 * 24) ); 
         out.print("the difference is these many days: "); 
         out.println(diffInDays); 
         DB db = mongo.getDB("practice");
         DBCollection reservations = db.getCollection("reservations");
         DBCursor dbCursor = null; 
         dbCursor = reservations.find(); 
         if(!dbCursor.hasNext())
         {
          out.println("Database is empty"); 
          BasicDBObject doc = new BasicDBObject("carCategory", carCategory).
                  append("carID", carID).
                  append("start_date_string", start_date_string).
                  append("end_date_string", end_date_string);
          reservations.insert(doc);
          k = 1; 
         }
         while(dbCursor.hasNext())
         {
          BasicDBObject bobj = (BasicDBObject) dbCursor.next(); 
          String temp_car_id = ( bobj.getString("carID") ).trim();
          if(temp_car_id.equals(carID))
          { 
            String start_date_string_db = ( bobj.getString("start_date_string")).trim();
            String end_date_string_db = ( bobj.getString("end_date_string")).trim(); 
            Date startDate_db = new SimpleDateFormat("yyyy-MM-dd").parse((start_date_string_db).trim());
            Date endDate_db = new SimpleDateFormat("yyyy-MM-dd").parse((end_date_string_db).trim());
            boolean c1 = startDate.after(startDate_db)&&startDate.before(endDate_db);
            //if(c1)out.println("c1 is true");
            //else out.println("c1 is not true");   
            boolean c2 = endDate.after(startDate_db)&&endDate.before(endDate_db);
            //if(c2)out.println("c2 is true");
            //else out.println("c2 is not true");  
            boolean c3 = startDate_db.after(startDate)&&startDate_db.before(endDate);
            //if(c3)out.println("c3 is true"); 
            //else out.println("c3 is not true"); 
            boolean c4 = endDate_db.after(startDate)&&endDate_db.before(endDate); 
            //if(c4)out.println("c4 is true");
            //else out.println("c4 is not true"); 
            boolean c5 = (c1 || c2 || c3 || c4); 
            if(c5)
            {
              l = l + 1; 
              // out.print(l); 
              // out.println("th loop"); 
            }            
          }
         }
         if(l>0)
         {
          out.println("reservation not possible"); 
         }
         if((l==0)&&(k==0))
         {
          BasicDBObject doc = new BasicDBObject("carID", carID).
              append("start_date_string", start_date_string).
              append("end_date_string", end_date_string);
          reservations.insert(doc);

         }
        } 
        catch (ParseException e) 
        {
          e.printStackTrace();
        }
         
             
         // BasicDBObject query = new BasicDBObject();
         // query.put("username", n);
         // query.put("password", p);
         // // If the collection does not exists, MongoDB will create it for you
         // DBCollection loindet = db.getCollection("loindet");
         // // collection selected successfully. 
         // DBCursor cursor = loindet.find(query);  
         // //int cnt = 0; 
         // int cnt = loindet.find(query).count(); 
         // if(cnt!=0)
         // {
         //     PrintWriter out = response.getWriter();
         //     //out.println("okay");
         //     HttpSession session = request.getSession();
         //     session.setAttribute( "sUserName", n );
         //     response.sendRedirect("index.jsp");
         // }

         // if(cnt == 0)
         // {
         //    response.sendRedirect("login.jsp"); 
         // }
      } catch (MongoException e) {
         e.printStackTrace();
      }
   }
   
   public void destroy()   {
      // do nothing.
   }
   
}