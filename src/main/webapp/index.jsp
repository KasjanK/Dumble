<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.dumbleBean"%>      

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="<%= request.getContextPath()%>/SearchServlet" method="post">
	Get from database <input type="text" name="searchString"> <br>
	<input type="submit" value="Go">
	</form>
	
	<%
	ArrayList<dumbleBean> rows = (ArrayList<dumbleBean>) request.getAttribute("searchResult");
	
	if (!(rows == null)) {
		out.print("<ul>");
		for (int i = 0; i < rows.size(); i++) {
			out.print("<li>");
			out.print(rows.get(i).getCol1());
			out.print(" - ");
			out.print(rows.get(i).getCol2());
			out.print(" - ");
			out.print(rows.get(i).getCol3());
			out.print(" - ");
			out.print(rows.get(i).getCol4());
			out.print(" - ");
			out.print(rows.get(i).getCol5());
			out.print(" - ");
			out.print(rows.get(i).getCol6());
			out.print(" - ");
			out.print(rows.get(i).getCol7());
			out.print(" - ");
			out.print(rows.get(i).getCol8());
			out.print(" - ");
			out.print(rows.get(i).getCol9());
			out.print(" - ");
			out.print(rows.get(i).getCol10());
			out.print(" - ");
			out.print(rows.get(i).getCol11());
			out.print(" - ");
			out.print(rows.get(i).getCol12());
			out.print(" - ");
			out.print(rows.get(i).getCol13());
			out.print(" - ");
			out.print(rows.get(i).getCol14());
			out.print(" - ");
			out.print(rows.get(i).getCol15());
			out.print(" - ");
			out.print(rows.get(i).getCol16());
			out.print(" - ");
			out.print(rows.get(i).getCol17());
			out.print("</li>");
		}
		out.print("</ul>");
	}
	%>
</body>
</html>