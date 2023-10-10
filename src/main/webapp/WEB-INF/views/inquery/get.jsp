<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- main 부분은 이쪽에 작성하세요  -->

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">온라인 상담 상세 조회</h4>
        
        
            <div class="form-group">
              <label for="root">문의 과정</label>
				<input class="form-control" name="course_name" value='<c:out value="${inquery.course_name}" />' readonly="readonly">
            </div>
          
        
          <div class="form-group">
              <label for="name">이름</label>
              <input class="form-control" name="name" value='<c:out value="${inquery.name }" />' readonly="readonly">
          </div>
          
          <div class="form-group">
              <label for="name">학생 아이디</label>
              <input class="form-control" name="stu_id" value='<c:out value="${inquery.stu_id }" />' readonly="readonly">
          </div>
		
		
		
		<div class="form-group">
		   		<label for="name">연락수단</label>
		  		<input class="form-control" name="contact_detail" value='<c:out value="${inquery.contact_detail }" />' readonly="readonly">
		</div>
		<div class="form-group">
			
		   		<label for="name">상담제목</label>
		  		<input class="form-control" name="title" value='<c:out value="${inquery.title }" />' readonly="readonly">
			
		 		<label for="name">상담내용</label>
		  		<input class="form-control" name="content" value='<c:out value="${inquery.content }" />' readonly="readonly">
		</div>
          <button data-oper="list" 
                class="btn btn-outline-secondary"
                onclick="location.href='/inquery/list'">
                목록
          </button>
          
          <button data-oper="remove" 
                class="btn btn-danger"
                onclick="location.href='/inquery/list'">
                삭제
          </button>
          
         <form id="operForm" action="/inquery/modify" method="get">
            <input type='hidden' id='oi_code' name='oi_code' value='<c:out value="${inquery.oi_code}"/>' >
            <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>' >
            <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>' >
         </form>
    </div>
  </div>
  </div>
</main>

<script type="text/javascript">
$(document).ready(function() {
var operForm = $('#operForm');
	
	$("button[data-oper='list']").on("click", function() {
		operForm.find("#oi_code").remove();
		operForm.attr("action", "/inquery/list");
		operForm.submit();
	});
	
	$("button[data-oper='remove']").on("click", function() {
		operForm.attr("action", "/inquery/remove").submit();
	})
});
	</script>

<!-- main end -->