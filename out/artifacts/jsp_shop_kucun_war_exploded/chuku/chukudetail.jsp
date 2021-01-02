<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.Dao.*" %>
<%
    request.setCharacterEncoding("gb2312");//设置页面字符集
    DBO db = new DBO();//初始化数据库链接
    String sp = "", jg = "", sl = "", ms = "", czr = "", cksj = "";//声明页面显示的变量
    String keyid = (String) request.getParameter("keyid");//以request方式获取 该条信息的 主键值
    String sql = "select a.*,b.spmc from chuku a,shangpin b where a.sp=b.spid and a.ckid=" + keyid;//拼接sql
    ResultSet rs = null;//声明结果集
    db.open();//打开数据库链接
    rs = db.query(sql);//查询结果集 返回 rs 变量中

/*
出库信息查看页面
*/
    if (rs.next()) {//遍历
        sp = rs.getString("spmc");//商品
        jg = rs.getString("jg");//价格
        sl = rs.getString("sl");//数量
        ms = rs.getString("ms");//描述
        czr = rs.getString("czr");//操作人
        cksj = rs.getString("cksj");//出库时间

    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <link rel="stylesheet" type="text/css" id="css" href="../images/style.css">

</head>
<body>
<form name="form" action="" method="post">


    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
        <tr>
            <td height="30" background="../images/bg_list.gif">
                <div style="padding-left:10px; font-weight:bold; color:#FFFFFF">出库详情</div>
            </td>
        </tr>
        <tr>
            <td bgcolor="#FFFFFF">
                <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">

                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">商品</td>
                        <td class="td"><%=sp%>
                        </td>

                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">价格</td>
                        <td class="td"><%=jg%>
                        </td>

                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">数量</td>
                        <td class="td"><%=sl%>
                        </td>

                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">描述</td>
                        <td class="td"><%=ms%>
                        </td>

                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">操作人</td>
                        <td class="td"><%=czr%>
                        </td>

                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">出库时间</td>
                        <td class="td"><%=cksj%>
                        </td>

                    </tr>


                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="12" class="td">&nbsp;</td>
                        <td colspan="2" class="td">
                            <INPUT class="button" type="button" value="返回" onClick="history.go(-1)"/>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>


</form>


</body>
</html>
