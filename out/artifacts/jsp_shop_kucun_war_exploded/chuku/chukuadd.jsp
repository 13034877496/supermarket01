<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.Dao.*" %>
<%
    request.setCharacterEncoding("gb2312");//设置页面字符集
    DBO db = new DBO();//初始数据链接
/*
出库信息添加页面
*/
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


            form.action = "chuku_add.jsp";
            form.submit();
        }
    </script>

</head>
<body>
<form name="form" action="" method="post">


    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
        <tr>
            <td height="30" background="../images/bg_list.gif">
                <div style="padding-left:10px; font-weight:bold; color:#FFFFFF">添加出库</div>
            </td>
        </tr>
        <tr>
            <td bgcolor="#FFFFFF">
                <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">

                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">商品 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td">
                            <select name="sp">


                                <%
                                    String sql = "select * from shangpin where 1=1";
                                    ResultSet rs = null;
                                    rs = db.query(sql);
                                    while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("spid")%>"><%=rs.getString("spmc")%>
                                </option>

                                <% }%>
                            </select>
                        </td>
                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">价格 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td"><input name="jg" placeholder="输入价格" type="text" value=""/></td>
                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">数量 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td"><input name="sl" placeholder="输入数量" type="text" value=""
                                                          onKeyUp="this.value=this.value.replace(/\D/g,'')"/></td>
                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">描述 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td"><input name="ms" placeholder="输入描述" type="text" value=""/></td>
                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">操作人 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td"><input name="czr" placeholder="输入操作人" type="text"
                                                          value="<%=session.getAttribute("yhm")%>"/></td>
                    </tr>
                    <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='#F1F5F8'"
                        bgcolor="#F1F5F8">
                        <td height="25" class="td">出库时间 <font color="#FF0000">*</font></td>
                        <td colspan="2" class="td"><input name="cksj" placeholder="输入出库时间" type="text"
                                                          value="<%=StaticMethod.getStringDate()%>"/></td>
                    </tr>


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
</html>
