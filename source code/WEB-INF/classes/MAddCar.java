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

public class MAddCar extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		try{
			//Get the values from the form
			String car_id = request.getParameter("car_id");
			int car_Price = Integer.parseInt(request.getParameter("car_Price"));
			String car_name = request.getParameter("car_name");
			String car_category = request.getParameter("car_category");
			String car_desc = request.getParameter("car_desc");
			String car_avail = request.getParameter("car_avail");							
										
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("practice");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection cars = db.getCollection("cars");
			System.out.println("Collection cars selected successfully");
				
			BasicDBObject doc = new BasicDBObject("title", "cars").
				append("car_id", car_id).
				append("car_name", car_name).
				append("car_category", car_category).
				append("car_Price", car_Price).
				append("car_desc", car_desc).
				append("car_avail", car_avail);
					
			cars.insert(doc);
				
			
			
			//Send the response back to the JSP
			PrintWriter out = response.getWriter();
			
			out.println("<html>");
			out.println("<head> </head>");
			out.println("<body>");
			out.println("<h1> "+ car_name + " Added Successfully</h1>");			
		} catch (MongoException e) {
			e.printStackTrace();
		}
	}
	
	public void destroy()	{
      // do nothing.
	}
	
}