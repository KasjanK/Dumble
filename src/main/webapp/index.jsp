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
			if (rows.get(i).getCol1() != null) { 
				out.print(rows.get(i).getCol1());
				out.print(" - ");
			}
			if (rows.get(i).getCol2() != null) { 
				out.print(rows.get(i).getCol2());
				out.print(" - ");
			}
			if (rows.get(i).getCol3() != null) { 
				out.print(rows.get(i).getCol3());
				out.print(" - ");
			};
			if (rows.get(i).getCol4() != null) { 
				out.print(rows.get(i).getCol4());
				out.print(" - ");
			}
			if (rows.get(i).getCol5() != null) { 
				out.print(rows.get(i).getCol5());
				out.print(" - ");
			}
			if (rows.get(i).getCol6() != null) { 
				out.print(rows.get(i).getCol6());
				out.print(" - ");
			}
			if (rows.get(i).getCol7() != null) { 
				out.print(rows.get(i).getCol7());
				out.print(" - ");
			}
			if (rows.get(i).getCol8() != null) { 
				out.print(rows.get(i).getCol8());
				out.print(" - ");
			}
			if (rows.get(i).getCol9() != null) { 
				out.print(rows.get(i).getCol9());
				out.print(" - ");
			}
			if (rows.get(i).getCol10() != null) { 
				out.print(rows.get(i).getCol10());
				out.print(" - ");
			}
			if (rows.get(i).getCol11() != null) { 
				out.print(rows.get(i).getCol11());
				out.print(" - ");
			}
			if (rows.get(i).getCol12() != null) { 
				out.print(rows.get(i).getCol12());
				out.print(" - ");
			}
			if (rows.get(i).getCol13() != null) { 
				out.print(rows.get(i).getCol13());
				out.print(" - ");
			}
			if (rows.get(i).getCol14() != null) { 
				out.print(rows.get(i).getCol14());
				out.print(" - ");
			}
			if (rows.get(i).getCol15() != null) { 
				out.print(rows.get(i).getCol15());
				out.print(" - ");
			}
			if (rows.get(i).getCol16() != null) { 
				out.print(rows.get(i).getCol16());
				out.print(" - ");
			}
			if (rows.get(i).getCol17() != null) { 
				out.print(rows.get(i).getCol17());
			}
			out.print("</li>");
		}
		out.print("</ul>");
		if (rows.size() == 0) {
			out.print("no matches");
		}
	}
	%>
</body>
</html>