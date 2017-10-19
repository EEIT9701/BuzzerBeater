package eeit.locationinfo.controller;

import java.io.IOException;
<<<<<<< HEAD
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LocationinfoServlet
 */
@WebServlet("/Locationinfo.do")
public class LocationinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LocationinfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
=======

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eeit.locationinfo.model.LocationinfoService;
import eeit.locationinfo.model.LocationinfoVO;

@WebServlet("/Locationinfo.do")
public class LocationinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LocationinfoServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		
		
		if("GET_ONE_TO_UPDATE".equals(action)){
			Integer locationID = Integer.parseInt(request.getParameter("locationID"));
			
			LocationinfoService locSvc = new LocationinfoService();
			LocationinfoVO locVO = locSvc.findByID(locationID);
			
			request.setAttribute("locVO", locVO);
			RequestDispatcher view = request.getRequestDispatcher("/location/updateLocation.jsp");
			view.forward(request, response);
		}
		
		if("DELETE_LOCATION".equals(action)){
			Integer locationID = Integer.parseInt(request.getParameter("locationID"));
			
			LocationinfoService locSvc = new LocationinfoService();
			locSvc.delete(locationID);
			
			RequestDispatcher view = request.getRequestDispatcher("/location/location_back.jsp");
			view.forward(request, response);
		}
		
		if("UPDATE_LOCATION".equals(action)){
			Integer locationID = Integer.parseInt(request.getParameter("locationID"));
			String locationName = request.getParameter("locationName");
			String locationAddr = request.getParameter("locationAddr");
			

			
			LocationinfoService locSvc = new LocationinfoService();
			locSvc.update(locationID, locationName, locationAddr);
			
			RequestDispatcher view = request.getRequestDispatcher("/location/location_back.jsp");
			view.forward(request, response);
		}
>>>>>>> branch 'master' of https://github.com/EEIT9701/BuzzerBeater.git
	}

}
