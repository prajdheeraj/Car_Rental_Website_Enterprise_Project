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

public class MAddDeal extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		try{
			//Get the values from the form
			String dealTitle = request.getParameter("dealTitle");
			String dealCode = request.getParameter("dealCode");
			String dealDescription = request.getParameter("dealDescription");
			String dealPercent = request.getParameter("dealPercent");			
										
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("practice");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection deals = db.getCollection("deals");
			System.out.println("Collection deals selected successfully");
				
			BasicDBObject doc = new BasicDBObject("title", "deals").
				append("dealTitle", dealTitle).
				append("dealCode", dealCode).
				append("dealDescription", dealDescription).
				append("dealPercent", dealPercent).
				append("dealCount", "0");
					
			deals.insert(doc);
				
			
			
			//Send the response back to the JSP
			PrintWriter out = response.getWriter();
			
			out.println("<html>");
			out.println("<head> </head>");
			out.println("<body>");
			out.println("<h1> "+ dealCode + " Added Successfully</h1>");			
		} catch (MongoException e) {
			e.printStackTrace();
		}
	}
	
	public void destroy()	{
      // do nothing.
	}
	
}