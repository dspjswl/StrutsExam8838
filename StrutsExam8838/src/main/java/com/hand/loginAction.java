package com.hand;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * Created by Administrator on 2015/9/4.
 */
public class loginAction extends ActionSupport {

//    private User user = new User(); //必须进行实例化
    private String username;
    private String password;


    public String login() {
        System.out.println("LoginAction输出" + username);
        System.out.println("LoginAction输出" + password);


        try {
            Connection connection = ConnectionFactory.getConnectionFactory().getConnection();
            Statement statement = connection.createStatement();
            String sql = "SELECT * FROM customer WHERE first_name='" + username + "' AND last_name='" + password + "'";
            ResultSet resultSet = statement.executeQuery(sql);
            System.out.println(sql);
            if (resultSet.next()) {
                ActionContext.getContext().getSession().put("username", username);
                ActionContext.getContext().getSession().put("password", password);
                return "success";
            } else
                return INPUT;
        } catch (SQLException e) {
            e.printStackTrace();
            return INPUT;
        }
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }
       /* public void validate()
    {
        if (username == null || username.trim().equals(""))
        {
            addFieldError("username","用户名不能为空！");
        }
        if (password == null || password.trim().equals(""))
        {
            addFieldError("password","密码不能为空！");
        }
    }*/
}
