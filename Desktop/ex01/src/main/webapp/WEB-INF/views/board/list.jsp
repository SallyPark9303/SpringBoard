<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-1g-12"></div>
	<!-- /.col-1g-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-1g-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Board List Page(${total })
				<button type="button" id="regBtn" class="btn btn-xs pull-right">Add
					Register</button>

			</div>
 	  <div class="panel-body">
			<!-- /.panel-body -->
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>#번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
					</tr>
				</thead>

				<c:forEach items="${list }" var="b">
					<tr>
						<td><c:out value="${b.bno }" /></td>
						<td><a class='move' href='<c:out value="${b.bno}"/>'><c:out value="${b.title }"/></a>
						</td>
						<td><c:out value="${b.writer }" /></td>
						<td><fmt:formatDate pattern="yyyy-mm-dd"
								value="${b.regdate}" /></td>
						<td><fmt:formatDate pattern="yyyy-mm-dd"
								value="${b.updateDate}" /></td>
					</tr>
				</c:forEach>
			</table>
			<!-- table태그 끝 -->
			<div class='pull-right'>
			<ul class="pagination">
			
			<c:if test="${pageMaker.prev }">
			<li class="paginate_button previous">
			<a href="${pageMaker.startPage -1 }">Previous</a>
			</li>
			</c:if>
			
			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}">
				<a href="${num}">${num }</a>
			</li>
			
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<li class="paginate_button next">
				<a href="${pageMaker.endPage +1 }">Next</a>
		</li>
			</c:if>
			</ul>
			</div>
		<!-- end Pagination -->

			<!-- model추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<!--  큰창:<div class="modal-dialog modal-lg"> 작은창 :<div class="modal-dialog modal-sm">  -->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">Modal Title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" id="myButtons1">
								Save changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
		<!-- end panel-body -->
	</div>
	</div>
	<!-- end panel -->
</div>
<!-- ./row -->

<form id='actionForm'action="/board/list" method='get'>
<input type='text' name='pageNum' value='${pageMaker.cri.pageNum }'>
<input type='text' name='amount' value='${pageMaker.cri.amount }'>

</form>


<script type="text/javascript">
$(document).ready(function(){

	var result ='<c:out value="${result}"/>';

	checkModal(result);
	history.replaceState({},null,null);

	function checkModal(result){
		if (result ===''|| history.state){
			return;
		}
		if(parseInt(result)>0){
			$(".modal-body").html("게시글"+parseInt(result)+"번이 등록되었습니다.");
		}
		$("#myModal").modal("show");
		
    }
	$("#regBtn").on("click", function(){
		self.location ="/board/register";
	});

	var actionForm =$("#actionForm");
	$(".paginate_button a").on("click",function(e){ 

	 e.preventDefault();
     console.log('click');
     actionForm.find("input[name='pageNum']").val($(this).attr("href")); 
     actionForm.submit();
	});
	
	//paginate_button 클래스의 a태그를 클릭하면
	//id가 actionForm인 form 에서 input태그의 name이 pageNum인 value(값)	에  this = ".paginate_button a" 의 href를 넣어라. 

	//게시물 조회를 위한 이벤트 처리 추가 페이지 2의 게시물클릭해서 상세보기화면에서 list클릭했을때 페이지 2화면이 보이도록
	$(".move").on("click",function(e){
		alert($(this).attr("href"));
	    e.preventDefault();
	    actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>"); // move 클래스의 href 값에 bno,amount,pageNum을 
	    actionForm.attr("action","/board/get");
	    actionForm.submit();
	});
		
	
});

</script>

<%@include file="../includes/footer.jsp"%>
