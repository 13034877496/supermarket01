<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.Dao.*" %>
<%
    request.setCharacterEncoding("gb2312");//设置页面字符集
    DBO db = new DBO();//初始链接数据库类
    String sql = "select a.*,b.spmc from chuku a,shangpin b where 1=1 and a.sp=b.spid ";//查询 出库sql语句
    db.open();//打开数据库链接
    String sp = (String) request.getParameter("sp");//查询条件：商品
    String jg = (String) request.getParameter("jg");//查询条件：价格

//商品 判断如果不为空，拼接到sql语句 通过 模糊查询的方式
    if (sp != null) {
        if (!sp.equals("")) {
            sql += " and b.spmc like '%" + sp + "%'";
        }
    }
//价格 判断如果不为空，拼接到sql语句 通过 模糊查询的方式
    if (jg != null) {
        if (!jg.equals("")) {
            sql += " and a.jg like '%" + jg + "%'";
        }
    }

    ResultSet rs = db.query(sql);//查询结果
//出库信息列表
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>出库列表</title>
</head>
<link rel="stylesheet" type="text/css" id="css" href="../images/style.css">

<body>
<form name="form" action="" method="post">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
        <tr>
            <td height="30" background="../images/bg_list.gif">
                <div style="padding-left:10px; font-weight:bold; color:#FFFFFF">查询条件</div>
            </td>
        </tr>
        <tr>
            <td bgcolor="#FFFFFF">商品&nbsp;&nbsp; <input type="text" name="sp"/>&nbsp;&nbsp;价格&nbsp;&nbsp; <input
                    type="text" name="jg"/>&nbsp;&nbsp;<input type=submit value="查询">
            </td>
        </tr>
    </table>

    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
        <tr>
            <td height="30" background="../images/bg_list.gif">
                <div style="padding-left:10px; font-weight:bold; color:#FFFFFF">出库管理</div>
            </td>
        </tr>
        <tr>
            <td bgcolor="#FFFFFF">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
                    <tr>
                        <td bgcolor="#FFFFFF">
                        </td>
                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#FFFFFF'"
                        bgcolor="#F1F5F8">
                        <td colspan="2">
                            <table width="100%" border="0" cellpadding="5" cellspacing="0">

                                <tr>
                                    <td height="15" class="td" width="8%">出库编号</td>
                                    <td height="15" class="td" width="8%">商品</td>
                                    <td height="15" class="td" width="8%">价格</td>
                                    <td height="15" class="td" width="8%">数量</td>
                                    <td height="15" class="td" width="8%">描述</td>
                                    <td height="15" class="td" width="8%">操作人</td>
                                    <td height="15" class="td" width="8%">出库时间</td>
                                    <td width="10%" class="td">操作</td>
                                </tr>


                            </table>

                        </td>
                    </tr>
                    <%
                        if (rs != null) {
                            while (rs.next()) {
                    %>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#FFFFFF">
                        <td colspan="2">
                            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td height="15" class="td" width="8%"><%=rs.getString("ckid")%>
                                    </td>
                                    <td height="15" class="td" width="8%"><%=rs.getString("spmc")%>
                                    </td>
                                    <td height="15" class="td" width="8%"><%=rs.getString("jg")%>
                                    </td>
                                    <td height="15" class="td" width="8%"><%=rs.getString("sl")%>
                                    </td>
                                    <td height="15" class="td" width="8%"><%=rs.getString("ms")%>
                                    </td>
                                    <td height="15" class="td" width="8%"><%=rs.getString("czr")%>
                                    </td>
                                    <td height="15" class="td" width="8%"><%=rs.getString("cksj")%>
                                    </td>
                                    <td class="td" width="10%"><a
                                            href="chukudetail.jsp?keyid=<%=rs.getString("ckid")%>">查看</a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <%
                            }
                        } else {
                            out.println("<tr> <td><font color=red><h2>没有符合条件的数据</h2></font></td></tr>");
                        }
                    %>
                </table>
            </td>
        </tr>
    </table>


</form>


</body>
<%
    db.close();
%>
</html>
