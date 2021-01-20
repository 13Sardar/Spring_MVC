<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List" import="com.zensar.Employee"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>List of All Employees</h2>
	<%
		List<Employee> listOfAllEmployees = (List<Employee>) request.getAttribute("listOfAllEmployees");
	%>

	<table border="5">
		<th>Employee Id</th>
		<th>Name</th>
		<th>Designation</th>
		<th>Salary</th>
		<th>Gender</th>
		<th>City</th>
		<%
			for (Employee employee : listOfAllEmployees) {
		%>
		<tr>
			<td><%=employee.getEmployeeId()%></td>
			<td><%=employee.getEmployeeName()%></td>
			<td><%=employee.getDesignation()%></td>
			<td><%=employee.getSalary()%></td>
			<td><%=employee.getGender()%></td>
			<td><%=employee.getCity() %></td>
			<td> <a href="delete?employeeId=<%=employee.getEmployeeId()%>">Delete</a> </td>
			<td> <a href="openUpdateForm?employeeId=<%=employee.getEmployeeId()%>">Update</a> </td>
		</tr>
		<%
			}
		%>
	</table>

<a href = "index.jsp">Click here to Return</a>

</body>
</html>