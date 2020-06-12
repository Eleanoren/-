<%--
  Created by IntelliJ IDEA.
  User: sleeper Sabrina
  Date: 2020/6/12
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>登 录</title>
  </head>
  <body>
    <form method="post" name="frmlogin" action="Servlet/Servlet">
      <h1>用户登录</h1>
      <table border=1>
        <tr>
          <td>账号</td>
          <td>
            <input type="text" name="id" value="账号" size="20" maxlength="20"
                   onfocus="if (this.value=='账号')  this.value='';"/>
          </td>
        </tr>
        <tr>
          <td>密码</td>
          <td>
            <input type="password" name="password" value="密码" size="20" maxlength="20"
                   onfocus="if (this.value=='密码')  this.value='';"/>

          </td>

        </tr>
        <tr>
          <input type="submit" name="Submit" value="提交" onclick="return Login()"/>
          <input type="reset" name="Reset" value="重置"/>
        </tr>
      </table>
    </form>
  <script>
    function Login() {
      var sUserName = document.frmlogin.id.value;
      var sPassword = document.frmlogin.password.value;

      if ((sUserName == "") || (sUserName == "账号")) {
        alert("请输入用户名!");
        return false;
      }
      if ((sPassword == "") || (sPassword == "密码")) {
        alert("请输入密码!");
        return false;
      }
    }
  </script>
  </body>
</html>
