<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    <%@include file="../includes/header.jsp"%>
    
    
      <div class="row">
    <div class="col-1g-12">
    <h1 class="page-header">Board Read Page</h1>
</div>
 <!-- /.col-1g-12 -->
       </div>
    <!-- /.row -->
<meta charset="UTF-8">
<div class="row">
<div class="col-1g-12">
<div class="panel panel-default">

<div class="panel-heading">Board Read Page</div>
<!-- /.panel.heading -->
<div class="panel-body">


<div class="form-group">
<label>Bno</label>
<input class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
</div>

<div class="form-group">
<label>Title</label>
<input class="form-control" name='title' value='<c:out value="${board.title }"/>'>
</div>


<div class="form-group">
<label>Text area</label>
<textarea class="form-control" rows="3" name='content' ><c:out value="${board.content }"/>
 </textarea>

<div class="form-group">
<label>Writer</label>
<input class="form-control" name='writer' value='<c:out value="${board.writer }"/>' >
</div>


<button data-oper='modify' class="btn btn-default"> Modify</button>
<button data-oper='list' class="btn btn-default"
onclick="location.href='/board/list'">List</button>


</div>
<!-- end panel-body -->
</div>
<!-- end panel-body -->
</div>
<!-- end panel -->
</div>
<!-- /.row -->
</div>

<form id='operForm' action="/board/modify" method="get">
<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno }"/>'>
<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
</form>

<script type="text/javascript">
$(document).ready(function(){
	var operForm =$("#operForm");
	$("button[data-oper='modify']").on("click", function(e){
    operForm.attr("action","/board/modify").submit();

		});

	$("button[data-oper='list']").on("click",function(e){
   operForm.find("#bno").remove();
   operForm.attr("action","/board/list")
   operForm.submit();
	});		
});
</script>
	<%@include file="../includes/footer.jsp"%>
