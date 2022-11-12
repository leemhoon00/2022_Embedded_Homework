<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="net.nurigo.java_sdk.api.Message" %>
<%@ page import="net.nurigo.java_sdk.exceptions.CoolsmsException" %>

<%
String name = request.getParameter("name");
String message = request.getParameter("message");

String api_key = "NCS8FIUCXECYA2V5";
String api_secret = "EZ4NQOD62TUQJBQINGTCP8SXM9AW0PSB";
Message coolsms = new Message(api_key, api_secret);

// 4 params(to, from, type, text) are mandatory. must be filled
HashMap<String, String> params = new HashMap<String, String>();
params.put("to", "01064225425");	// 수신전화번호
params.put("from", "01064225425");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
params.put("type", "SMS");
params.put("text", "송신자 : "+name+"\n"+message);

params.put("app_version", "test app 1.2"); // application name and version

try {
  JSONObject obj = (JSONObject) coolsms.send(params);
  System.out.println(obj.toString());
} catch (CoolsmsException e) {
  System.out.println(e.getMessage());
  System.out.println(e.getCode());
}

out.println("<script>document.location.href='index.html';</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>