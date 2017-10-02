<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%-- forEach icin --%>
<!DOCTYPE html>
<html>
<head>
<title>
Musteri Listesi
</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>

<div id="wrapper" >
	<div id="header" >
		<h2>
			CRM - Customer RelationShip Manager
		</h2>
	</div>
</div>
<div id="container">
	<div id="content" >
		<input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd'; return false;" class="add-button" />
		<table>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email Name</th>
				<th>Action</th>
			</tr>
			<c:forEach var="tempCustomer" items="${customers}">
				<!-- burasi cok onemli burda customer'in id'sini gonderiyoruz url ile -->
				<c:url var="updateLink" value="/customer/showFormForUpdate">
					<c:param name="customerId" value="${tempCustomer.id}"></c:param>
				</c:url>
				<c:url var="deleteLink" value="/customer/delete">
					<c:param name="customerId" value="${tempCustomer.id}"></c:param>
				</c:url>
				<tr>
					<td>${tempCustomer.firstName}</td>
					<td>${tempCustomer.lastName}</td>
					<td>${tempCustomer.email}</td>
					<td>
						<!-- display the update link -->
						<a href="${updateLink}" class="save">Update</a>
						<a href="${deleteLink}" class="save" onclick="if(!(confirm('Are you sure you want to delete the customer'))) return false">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

</body>
</html>