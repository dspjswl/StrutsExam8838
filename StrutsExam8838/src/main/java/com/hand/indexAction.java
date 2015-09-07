package com.hand;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2015/9/7.
 */
public class indexAction extends ActionSupport {
    Connection conn = ConnectionFactory.getConnectionFactory().getConnection();
    Statement statement;
    public String index(){
        return "index";
    }
    public String exit(){
        ActionContext ac = ActionContext.getContext();
        Map session = ac.getSession();
        session.clear();
        return "exit";
    }
    public void GetJson(){

        HttpServletResponse response = (HttpServletResponse)
                ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
        HashMap<Integer, Customer> map = new HashMap<Integer, Customer>();
        int i = 0;
        try {
            statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("SELECT first_name,last_name,address.address,email,customer_id,customer.last_update from customer left join address on customer.address_id=address.address_id limit 0,2000");
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setFirstName(rs.getString(1));
                customer.setLastName(rs.getString(2));
                customer.setAddress(rs.getString(3));
                customer.setEmail(rs.getString(4));
                customer.setCustomerid(rs.getInt(5));
                customer.setLastUpdate(rs.getString(6));
                map.put(i, customer);
                i++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        JsonObject Object = new JsonObject();
        JsonArray jsonArray = new JsonArray();
        for (i = 0; i < map.size(); i++) {
            JsonObject people = new JsonObject();
            people.addProperty("FirstName", map.get(i).getFirstName());
            people.addProperty("LastName", map.get(i).getLastName());
            people.addProperty("Address", map.get(i).getAddress());
            people.addProperty("Email", map.get(i).getEmail());
            people.addProperty("Customerid", map.get(i).getCustomerid());
            people.addProperty("LastUpdate", map.get(i).getLastUpdate());

            jsonArray.add(people);
        }
        try {
            Object.add("customer", jsonArray);
            PrintWriter out = response.getWriter();
            out.write(Object.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void edit(){
        HttpServletRequest request = (HttpServletRequest)
                ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
        String Customerid = request.getParameter("customerid");
        String FirstName = request.getParameter("firstname");
        String LastName = request.getParameter("lastname");
        String Address_id=request.getParameter("address");
        String Email=request.getParameter("email");
        try {
            Statement st = conn.createStatement();

            String sql = "update customer set first_name = '"+FirstName+"',last_name='"+LastName+"',address_id="+Address_id+",email='"+Email+"' where customer_id="+Customerid;

            st.execute(sql);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public void delete(){
        HttpServletRequest request = (HttpServletRequest)
                ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
        HttpServletResponse response = (HttpServletResponse)
                ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
        String customer_id=request.getParameter("delete_id");
        try {
            Statement st = conn.createStatement();
            String sql = "delete from customer where customer_id="+customer_id;
            st.execute(sql);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void GetAddressJson(){
        HttpServletResponse response = (HttpServletResponse)
                ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
        HashMap<Integer, Addressinfo> map = new HashMap<Integer, Addressinfo>();
        int i = 0;
        try {
            statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("SELECT address,address_id FROM address");
            while (rs.next()) {
                Addressinfo addressinfo = new Addressinfo();
                addressinfo.setAddress(rs.getString(1));
                addressinfo.setAddress_id(rs.getInt(2));
                map.put(i, addressinfo);
                i++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        JsonObject Object = new JsonObject();
        JsonArray jsonArray = new JsonArray();
        for (i = 0; i < map.size(); i++) {
            JsonObject addr = new JsonObject();
            addr.addProperty("Address", map.get(i).getAddress());
            addr.addProperty("Addressid", map.get(i).getAddress_id());
            jsonArray.add(addr);
        }
        try {
            Object.add("address", jsonArray);
            PrintWriter out = response.getWriter();
            out.write(Object.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
