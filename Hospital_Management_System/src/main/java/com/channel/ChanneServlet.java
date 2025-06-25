package com.channel;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChanneServlet")
public class ChanneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ChannelService channelService = new ChannelServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("pid");
		String name = request.getParameter("pname");
		String age = request.getParameter("age");
		String did = request.getParameter("select");
		String date = request.getParameter("date");

		boolean isTrue = channelService.addAppointment(did, pid, date, name, age);

		if (isTrue) {
			List<Channel> appointments = channelService.getAppointmentsByPatientId(pid);
			request.setAttribute("appointments", appointments);
			request.getRequestDispatcher("channelView.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("unsuccess.jsp").forward(request, response);
		}
	}
}
