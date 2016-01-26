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

public class cars_available_new extends HttpServlet
{
	private static final long serialVersionUID = 1L;
   	MongoClient mongo;
   	public void init() throws ServletException
   	{
   		// Connect to Mongo DB
   		mongo = new MongoClient("localhost", 27017);
   	}
   	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   	{
        	Date startDate = function_date(request.getParameter("startDate")); 
        	Date endDate = function_date(request.getParameter("endDate"));
          if(startDate.compareTo(endDate)<0){

      try
      {
          List available_cars = new ArrayList();
          String car_category = request.getParameter("car_category"); 
          HttpSession session = request.getSession();
          session.setAttribute( "sCategory", car_category);
        	PrintWriter out = response.getWriter(); 
        	DB db = mongo.getDB("practice");
        	DBCollection cars = db.getCollection("cars");
        	BasicDBObject whereQuery = new BasicDBObject();
        	whereQuery.put("car_category", car_category);
        	DBCursor cursor_car = cars.find(whereQuery);
        	while(cursor_car.hasNext())
        	{
        		BasicDBObject bobj = (BasicDBObject) cursor_car.next();
        		String carID = ( bobj.getString("car_id")).trim();
            out.println(carID); 
            out.println("is being tested against"); 
        		DBCollection reservations = db.getCollection("reservations"); 
        		BasicDBObject whereQueryReservations = new BasicDBObject(); 
        		whereQueryReservations.put("carID", carID); 
        		DBCursor cursor_reservations = reservations.find(whereQueryReservations); 
        		int warningFlag = 0; 
        		if(!cursor_reservations.hasNext())
        		{
        			warningFlag = 0;   
        			out.println("no cars found"); 
        		}
        		else
        		{
        			while(cursor_reservations.hasNext())
        			{
        				BasicDBObject bobj1 = (BasicDBObject) cursor_reservations.next();
        				out.println(""); 
        				out.print(carID);
        				out.println(" is being tested now."); 
                boolean c6 = false;  
        				String start_date_string_reservations = ( bobj1.getString("start_date_string")).trim();
			            String end_date_string_reservations = ( bobj1.getString("end_date_string")).trim();
			            Date start_date_reservations = function_date(start_date_string_reservations); 
			            Date end_date_reservations = function_date(end_date_string_reservations); 
			            boolean c1 = startDate.after(start_date_reservations)&&startDate.before(end_date_reservations);
			            if(c1)out.println("c1 is true");
			            else out.println("c1 is not true");   
			            boolean c2 = endDate.after(start_date_reservations)&&endDate.before(end_date_reservations);
			            if(c2)out.println("c2 is true");
			            else out.println("c2 is not true");  
			            boolean c3 = start_date_reservations.after(startDate)&&start_date_reservations.before(endDate);
			            if(c3)out.println("c3 is true"); 
			            else out.println("c3 is not true"); 
			            boolean c4 = end_date_reservations.after(startDate)&&end_date_reservations.before(endDate); 
			            if(c4)out.println("c4 is true");
			            else out.println("c4 is not true"); 
                  if((startDate.equals(start_date_reservations))&&(endDate.equals(end_date_reservations)))
                   c6 = true; 
			            boolean c5 = (c1 || c2 || c3 || c4 || c6); 
			            if(c5)
			            	warningFlag = warningFlag + 1; 
        			}
        		}
        		if(warningFlag>0)
        		{
        			out.print(carID); 
        			out.println(" is not available"); 
        		}
        		else
        		{
        			out.print(carID);
              available_cars.add(carID);  
        			out.println(" is available");
        		}
        	}

     		request.setAttribute("available_cars", available_cars); 
        request.getRequestDispatcher("cars_available.jsp").forward(request,response);
      }
   		catch (MongoException e)
   		{
   			e.printStackTrace(); 
   		}
    }
    else 
    {
      PrintWriter out = response.getWriter();
      out.println("check your dates and give them again. "); 
    }
   	}
   	public static Date function_date(String a)
   	{
   		Date date1 = null; 
   		try
   		{
   			date1 = new SimpleDateFormat("yyyy-MM-ddhh:mm").parse((a).trim());
   		}
   		catch (ParseException e)
   		{
   			e.printStackTrace();
   		}
   		return date1; 
   	}
}