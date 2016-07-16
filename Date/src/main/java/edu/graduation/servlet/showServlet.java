package edu.graduation.servlet;

import edu.graduation.service.createDatingService;
import edu.graduation.service.impl.createDatingServiceImpl;
import edu.graduation.bean.Dating;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Tony on 16/4/19.
 */
public class showServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        createDatingService show=new createDatingServiceImpl();
         List<Dating> dateList=show.show();
        req.setAttribute("dateList",dateList);
          req.getRequestDispatcher("WEB-INF/jsps/Main.jsp").forward(req, resp);
    }
}
