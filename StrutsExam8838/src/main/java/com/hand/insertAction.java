package com.hand;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by Administrator on 2015/9/7.
 */
public class insertAction extends ActionSupport {
    Connection conn = ConnectionFactory.getConnectionFactory().getConnection();


    public void insert(){
        HttpServletRequest request = (HttpServletRequest)
                ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
        String fir = request.getParameter("FirstName");
        String las = request.getParameter("LastName");
        String email = request.getParameter("Email");
        String address_id = request.getParameter("Address");
        try {
            Statement st = conn.createStatement();
            String sql = "insert into customer (first_name,last_name,email,address_id,store_id,create_date) values('"+fir+"','"+las+"','"+email+"',"+address_id+",1,'2015-09-08');";
            st.execute(sql);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
