<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>




<!-- Page Heading -->
         
                    
                <!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">강의 관리</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
        
        <div>
           <button id ='regBtn' type="button" class="btn btn-secondary  float-right">강의 등록</button><br>
        </div>
        
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>지점</th>
                        <th>과정</th>
                        <th>강의</th>
                        <th>강사</th>
                        <th>개강</th>
                        <th>종강</th>
                        <th>동영상관리</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
              
            
                
             <c:forEach items="${classmanage}" var="course">
                <tr>
              		<td><c:out value="${course.branch_name}"/></td> 
              		<td><c:out value="${course.course_name}"/></td>   
              		<td>
              			<c:out value="${course.class_name }"/>
              		</td>   
              		<td><c:out value="${course.teacher_name }"/></td>   
              		<td><fmt:formatDate pattern="yyyy/MM/dd" value="${course.start_date }"/></td>   
              		<td><fmt:formatDate pattern="yyyy/MM/dd" value="${course.end_date }"/></td>   
              		<td>
              			<form id="classcode" action="/course/classmanage" method="get">
              				<a class="video" href='<c:out value="${course.class_code }"/>'>동영상</a>
              			</form>
              		</td>
              		
              		<td>
              		<a class="modify" href='<c:out value="${course.class_code}"/>'>수정</a></td>
              		<td>
              		<a class="delete" href='/course/classdelete?class_code=<c:out value="${course.class_code}"/>'>삭제</a></td>
              		    
                    
                </tr>
             </c:forEach>
            </tbody>
                
            </table>
        </div>
        
         <div class="row">
					<div class="col-lg-12">
						<form id='searchForm' action="/course/classmanage" method="get">
							<select name='type'>
								<option value=""<c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>--</option>
								<option value="TWC"<c:out value="${pageMaker.cri.type eq 'TWCR' ? 'selected' : '' }"/>>전체</option>
								<option value="T"<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>지점</option>
								<option value="C"<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>과정</option>
								<option value="W"<c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }"/>>강의</option>
								<option value="R"<c:out value="${pageMaker.cri.type eq 'R' ? 'selected' : '' }"/>>강사</option>
								
							</select>
							<input type ="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
							<input type ="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"/>'>
							<input type ="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"/>'>
							<button class="btn btn-warning">Search</button>
						</form>
					</div>
                </div>
        
    
	
				<div class="float-right" >
                	
                		<ul class="pagination">
                			<c:if test="${pageMaker.prev }">
                				<li class="page-item"><a class ="page-link" href="${pageMaker.startPage -1 }">
                				Previous
                				</a>
                				</li>
                			</c:if>
                			
                			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                				<li class="page-item" ${pageMaker.cri.pageNum == num ? "active":"" }"><a class="page-link" href="${num }">${num }</a></li>
                			</c:forEach>
                			
                			<c:if test="${pageMaker.next }">
                				<li class="page-item"><a class="page-link" href="${pageMaker.endPage +1 }">Next
                				</a></li>
                			</c:if>
                		</ul>
                	</div>
                
                <!-- page, amount 가져오는 form -->
                <form id = 'actionForm' action="/course/classmanage" method='get'>
                	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                	<input type="hidden" name="type" value="<c:out value="${pageMaker.cri.type }" />">
                	<input type="hidden" name="keyword" value="<c:out value="${pageMaker.cri.keyword }" />">
             
                </form>          
                

  
  
    
                <!-- /.modal start -->
                <div class="modal fade" id ="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                	<div class="modal-dialog">
                		<div class="modal-content">
                			<div class="modal-header">
                				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                			
                			</div>
                			<div class="modal-body">처리가 완료되었습니다.</div>
                			<div class="modal-footer">
                				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                				
                		</div>
                	</div>
                	<!-- modal content -->
                </div>
                <!-- modal dialog -->
                                  
          </div>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	var result='<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({}, null, null);
	
	function checkModal(result){
		if(result ===''){
			return;
		}
		if(parseInt(result)>0){
			$(".modal-body").html("강의가 등록되었습니다.");
		}
		$("#myModal").modal("show");
	}
	
	$("#regBtn").on("click", function(){
		
		self.location = "/course/classregister";
});
	
	var actionForm = $("#actionForm");
	
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		
		actionForm.append("<input type='hidden' name='class_code' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/course/classread");
		actionForm.submit();
	});
	
	$(".modify").on("click", function(e){
		e.preventDefault();
		
		actionForm.append("<input type='hidden' name='class_code' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/course/classmodify");
		actionForm.submit();
	});
	
	var classcode = $("#classcode")
	
	$(".video").on("click", function(e){
			e.preventDefault();
		
		classcode.append("<input type='hidden' name='class_code' value='"+$(this).attr("href")+"'>");
		classcode.attr("action","/course/videolist");
		classcode.submit();
	});
	
	
	$("#searchForm button").on("click", function(e){
		
		if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요.");
				return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요.");
				return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
	
});


</script>                    
                                 
 <%@ include file="../include/footer.jsp" %>