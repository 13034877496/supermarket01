<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.Dao.*" %>

<%
    /*
    出库添加后台
    */
    DBO db = new DBO();//初始数据库链接
    request.setCharacterEncoding("gb2312");//设置字符集
    ResultSet rs = null;//声明结果集
    String keyid = (String) request.getParameter("keyid");
    String sp = (String) request.getParameter("sp");// 变量 名 :商品
    String jg = (String) request.getParameter("jg");// 变量 名 :价格
    String sl = (String) request.getParameter("sl");// 变量 名 :数量
    String ms = (String) request.getParameter("ms");// 变量 名 :描述
    String czr = (String) request.getParameter("czr");// 变量 名 :操作人
    String cksj = (String) request.getParameter("cksj");// 变量 名 :出库时间

    String sql = "";//声明sql

    int row = 1;///定义执行结果
    int num = 0;
    sql = "select * from shangpin where spid='" + sp + "'";
    try {
        rs = db.query(sql);
        if (rs.next()) {
            num = rs.getInt("sl");
        }

        if (Integer.parseInt(sl) > num) {

            out.println("<script>");
            out.println("alert('操作失败，库存量不足');");
            out.println("window.location='chukuadd.jsp'");
            out.println("</script>");
            return;
        }


        sql = "update shangpin set sl=sl-" + sl + " where spid='" + sp + "'";
        db.update(sql);

        sql = "insert into chuku(sp,jg,sl,ms,czr,cksj) values('" + sp + "','" + jg + "','" + sl + "','" + ms + "','" + czr + "','" + cksj + "')";
        ;//出库SQL 语句
        //int row =0;
        row = db.update(sql);//执行sql语句
    } catch (Exception e) {
        System.out.println(e.toString());
    }
    if (row == 1) {//操作成功
        out.println("<script>");
        out.println("alert('操作成功');");
        out.println("window.location='chukuadd.jsp'");
        out.println("</script>");
    } else {//操作失败
        out.println("<script>");
        out.println("alert('操作失败');");
        out.println("window.location='chukuadd.jsp'");
        out.println("</script>");
    }
    db.close();
%>

