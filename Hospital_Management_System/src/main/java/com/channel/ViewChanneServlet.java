package com.channel;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewChanneServlet")
public class ViewChanneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ChannelService channelService = new ChannelServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("pid");

		if (pid != null && !pid.isEmpty()) {
			List<Channel> appointments = channelService.getAppointmentsByPatientId(pid);
			request.setAttribute("appointments", appointments);
			request.getRequestDispatcher("channelView.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("unsuccess.jsp").include(request, response);
		}
	}
}
