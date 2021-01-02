<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.Dao.*" %>
<%
    request.setCharacterEncoding("gb2312");//设置页面字符集
    DBO db = new DBO();//数据库链接
    String sp = "", jg = "", sl = "", ms = "", czr = "", cksj = "";//初始化变量
    String keyid = (String) request.getParameter("keyid");//主键
    String sql = "select * from chuku where ckid=" + keyid;//定义查询sql语句
    ResultSet rs = null;//定义查询结果集
    db.open();//打开数据库链接
    rs = db.query(sql);//执行查询结果

/*
出库信息修改页面
*/
    if (rs.next()) {//遍历结果集查询 相应的变量
        sp = rs.getString("sp");
        jg = rs.getString("jg");
        sl = rs.getString("sl");
        ms = rs.getString("ms");
        czr = rs.getString("czr");
        cksj = rs.getString("cksj");

    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <link rel="stylesheet" type="text/css" id="css" href="../images/style.css">

    <script language="javascript">
        function checkDo() {
            if (form.sp.value == "") {
                alert("商品不能为空");
                return false;
                form.sp.focus();
            }

            if (form.jg.value == "") {
                alert("价格不能为空");
                return false;
                form.jg.focus();
            }

            if (form.sl.value == "") {
                alert("数量不能为空");
                return false;
                form.sl.focus();
            }

            if (form.ms.value == "") {
                alert("描述不能为空");
                return false;
                form.ms.focus();
            }

            if (form.czr.value == "") {
                alert("操作人不能为空");
                return false;
                form.czr.focus();
            }

            if (form.cksj.value == "") {
                alert("出库时间不能为空");
                return false;
                form.cksj.focus();
            }


            form.action = "chuku_update.jsp";
            form.submit();
        }
    </script>

</head>
<body>

<form name="form" action="" method="post">


    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
        <tr>
            <td height="30" background="../images/bg_list.gif">
                <div style="padding-left:10px; font-weight:bold; color:#FFFFFF">修改出库</div>
            </td>
        </tr>
        <tr>
            <td bgcolor="#FFFFFF">
                <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">

                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">商品 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td"><input type="text" style="FONT-SIZE: 12px; WIDTH: 300px"
                                                          placeholder="输入商品" name=sp value="<%=sp%>"></td>
                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">价格 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td"><input type="text" style="FONT-SIZE: 12px; WIDTH: 300px"
                                                          placeholder="输入价格" name=jg value="<%=jg%>"></td>
                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">数量 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td"><input type="text" style="FONT-SIZE: 12px; WIDTH: 300px"
                                                          placeholder="输入数量" name=sl value="<%=sl%>"></td>
                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">描述 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td"><input type="text" style="FONT-SIZE: 12px; WIDTH: 300px"
                                                          placeholder="输入描述" name=ms value="<%=ms%>"></td>
                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">操作人 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td"><input type="text" style="FONT-SIZE: 12px; WIDTH: 300px"
                                                          placeholder="输入操作人" name=czr value="<%=czr%>"></td>
                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">出库时间 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td"><input type="text" style="FONT-SIZE: 12px; WIDTH: 300px"
                                                          placeholder="输入出库时间" name=cksj value="<%=cksj%>"></td>
                    </tr>


                    <input type="hidden" name="keyid" value="<%=keyid%>">
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="12" class="td">&nbsp;</td>
                        <td colspan="2" class="td">
                            <input type="button" value="保存" name="B1" class="btn" style="width:60px"
                                   onclick="checkDo()"/>
                            &nbsp;&nbsp;
                            <input type="reset" value="取消" style="width:60px" name="chanel" class="btn"/>

                        </td>
                    </tr>
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
