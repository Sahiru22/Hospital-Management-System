package com.channel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteAppoinmentServlet")
public class DeleteAppoinmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ChannelService channelService = new ChannelServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("cid");
		String pid = request.getParameter("pid");

		boolean isTrue = channelService.deleteAppointment(id);

		request.setAttribute("pid", pid);
		RequestDispatcher dispatcher = request.getRequestDispatcher(isTrue ? "channelView.jsp" : "unsuccess.jsp");
		dispatcher.forward(request, response);
	}
}
