package eeit.locationinfo.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import eeit.locationinfo.model.LocationinfoService;

@WebServlet("/ImgServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 500)
public class ImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ImgServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 取得JSP <from enctype="multipart/form-data"> 表單回傳資料
		try {
			//取得表單內locationPhoto物件
			Part part = request.getPart("locationPhoto");
			
			//轉型
			FileInputStream fis = (FileInputStream) part.getInputStream();
			byte[] bt = IOUtils.toByteArray(fis);
			
			Base64.Encoder encoder = Base64.getEncoder();
			String locationPhoto = encoder.encodeToString(bt);

			//呼叫永續層進行存取
			LocationinfoService locSvc = new LocationinfoService();
			locSvc.insert("圖片", "測試","mark", locationPhoto);
			
			// 返回原網頁顯示圖片
			request.setAttribute("base64code", locationPhoto);
			RequestDispatcher v = request.getRequestDispatcher("/location/addLocation.jsp");
			v.forward(request, response);
			
			
			
		} catch (Exception e) {
			try {
				throw e;
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}

}
