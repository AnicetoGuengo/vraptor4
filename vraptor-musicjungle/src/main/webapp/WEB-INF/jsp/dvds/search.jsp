<%@ include file="/header.jsp" %> 

<h1><fmt:message key="search_results"/></h1>

<table class="table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th>Title</th>
			<th>Description</th>
			<th>Type</th>
			<td>Owners</td>
			<td></td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dvd" items="${dvds}">
			<tr>
				<td>${dvd.title}</td>
				<td>${dvd.description}</td>
				<td><fmt:message key="${dvd.type}"/></td>
				<td>
					<c:forEach var="copy" items="${dvd.rents}">
						${rent.owner.name}<br/>
					</c:forEach>
				</td>
				<td class="td-options">
					<form action="<c:url value="/users/${userInfo
							.user.login}/dvds/${dvd.id}"/>" method="post">
							
						<button type="submit" class="btn btn-primary">
							<input type="hidden" name="_method" value="PUT"/>
							<span class="icon icon-plus icon-white"></span>
							<fmt:message key="add_to_my_list"/>
						</button>
					</form>
					
					<button class="btn btn-primary">
						<span class="icon icon-download-alt icon-white"></span>
						download
					</button>
			   </td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<%@ include file="/footer.jsp" %> 