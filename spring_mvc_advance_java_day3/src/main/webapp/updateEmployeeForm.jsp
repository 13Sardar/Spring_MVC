<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.zensar.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<% Employee employee = (Employee)request.getAttribute("employee"); %>
<body>
<h2>Update employee form</h2>

<form action="updateDetails" method="get">
<input type="hidden" name="requestAction" value="update"/>
<table>
<tr>
<td>Employee Id:</td>
<td><input type="text" name="employeeId" value="<%=employee.getEmployeeId() %>" /></td>
</tr>

<tr>
<td>Employee Name:</td>
<td><input type="text" name="employeeName" value="<%=employee.getEmployeeName() %>" /></td>
</tr>


<tr>
<td>Employee Designation:</td>
<td><input type="text" name="designation" value="<%=employee.getDesignation() %>"/></td>
</tr>

<tr>
<td>Employee Salary:</td>
<td><input type="text" name="salary" value="<%=employee.getSalary() %>"/></td>
</tr>

<tr>
<td>Gender:</td>
<td>Male <input type="radio" name="gender" value="male" <%if(employee.getGender().equalsIgnoreCase("male")){%>checked<%}%>/>
&nbsp;&nbsp; 
Female<input type="radio" name="gender" value="female" <%if(employee.getGender().equalsIgnoreCase("female")){%>checked<%}%> />
</td>
</tr>

<tr>
    <td>City:</td>
    <td>
        <select name = "city">
        <option value = "pune" label="pune"<%if(employee.getCity().equalsIgnoreCase("Pune")){ %>selected<%} %>>
        <option value = "Mumbai" label="Mumbai"<%if(employee.getCity().equalsIgnoreCase("Mumbai")){ %>selected<%} %>>
        <option value = "Delhi" label="Delhi"<%if(employee.getCity().equalsIgnoreCase("Delhi")){ %>selected<%} %>>
        </select>    
</tr>

<tr>
<td> &nbsp; </td>
<td> <input type="submit" value="Update Employee"/></td>
</tr>

</table>
</form>
</body>
</html>