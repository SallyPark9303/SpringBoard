<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    <%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form role="form" action="/board/modify" method="post">
		<div class="form.group">
		<label>Bno</label>
		<input class="form-control" name='bno'
		value='<c:out value="${board.bno }"/>' readonly="readonly">
		
		</div>
		
		<div class="form.group">
		<label>Title</label>
		<input class="form-control" name='title'
		value='<c:out value="${board.title }"/>'>
		
		</div>
		
		<div class="form.group">
		<label>Content</label>
		<input class="form-control" name='content'
		value='<c:out value="${board.content}"/>'>
		
		</div>
		
		<div class="form.group">
		<label>Writer</label>
		<input class="form-control" name='writer'
		value='<c:out value="${board.writer}"/>' readonly="readonly" >
		</div>
		
		<div class="form.group">
		<label>RegDate</label>
		<input class="form-control" name='regdate'
		value='<fmt:formatDate pattern ="yyyy-mm-dd" value="${board.regdate }"/>' readonly="readonly" >
		</div>
		
		<div class="form.group">
		<label>Update Date</label>
		<input class="form-control" name='updateDate'
		value='<fmt:formatDate pattern ="yyyy-mm-dd" value="${board.updateDate }"/>' readonly="readonly" >
		</div>
		
		<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
		<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
		<button type="submit" data-oper='list' class="btn btn-info">List</button>

</form>
</body>

<script type="text/javascript">
$(document).ready(function(){

	var formObj =$("form");
	$('button').on("click",function(e){
		e.preventDefault();
		
		var operation =$(this).data("oper");
		
		if(operation ==='remove'){
			formObj.attr("action","/board/delete");  //post방식   =>@PostMapping  
			//self.location="/board/delete?bno=${board.bno}";    //get 방식  =>@GetMapping
		}else if(operation ==='list'){
			//move to list
			self.location="/board/list";
			return;
		}
		formObj.submit();
		//self.location="/board/modify";
	});
});
</script>

</html>
	<%@include file="../includes/footer.jsp"%>
