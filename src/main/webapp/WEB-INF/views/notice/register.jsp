<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- main 부분은 이쪽에 작성하세요  -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">게시글 등록</h1>
			</div>
		</div>
<div class="row">
         <div class="col-lg-12">
            <div class="panel panel-default">
               <div class="panel-body">
                  <form role="form" action="/notice/register" method="post">
                     <div class="form-group">
                        <label>제목</label>
                        <input class="form-control" name="title">
                     </div>
                     <div class="form-group">
                        <label>내용</label>
                        <textarea class="form-control" rows="3" name="content"></textarea>
                     </div>
                     <div class="form-group">
                        <label>작성자</label>
                        <input class="form-control" name="admin_id" value="${member.admin_id}" readonly/>
                     </div>
<!--   파일 첨부                  
                     <div class="row">
                        <div class="col-lg-12">
                           <div class="panel panel-default">
                           
                              <div class="panel-heading">파일첨부</div>
                              <div class="panel-body">
                                 <div class="form-group uploadDiv">
                                    <input type="file" name="uploadFile" multiple>
                                 </div>
                              </div>
                              
                              <div class="uploadResult">
                                 <ul>
                                    
                                 </ul>
                              </div>
                           
                           </div>
                        </div>
                     </div>
-->                     
                     <button type="submit" class="btn btn-secondary">등록</button>
                     <button type="reset" class="btn btn-outline-secondary">취소</button>
                  </form>
               </div>
            </div>
         </div>
      </div>

<!-- main end -->

<%@ include file="../include/footer.jsp" %>