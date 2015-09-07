package com.hand;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import java.util.Map;

/**
 * Created by Administrator on 2015/9/5.
 */
public class MyInterceptor extends AbstractInterceptor {
    public String intercept(ActionInvocation invocation) throws Exception {

        String actionName = invocation.getProxy().getActionName();
        ActionContext actionContext = invocation.getInvocationContext();
        System.out.println(actionName);
        if(actionName.equals("index_index")) {
            String output = "开始拦截";
            System.out.println(output);
//            System.out.println("拦截结束");
//            return invocation.invoke();
            Map<String, Object> session = actionContext.getSession();
            if(session.get("username")!=null) {
                System.out.println(session.get("username"));
                return invocation.invoke();
            }
            else
                return "error";
        }


        //------------------------------------------------------------
        //Map map = (Map) ActionContext.getContext().get("request"); //-
        //String username = (String) map.get("username");            //-
        //------------------------------------------------------------
//        Map<String, Object> session = actionContext.getSession();
//        String username = (String) session.get("username");
//        System.out.println("拦截器输出：" + username);
//        System.out.println("拦截结束");
        return invocation.invoke();
    }
}
