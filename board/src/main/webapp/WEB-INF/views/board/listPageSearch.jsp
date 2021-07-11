<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>운동 블로그</title>
        <link rel="icon" type="image/x-icon" href="../../resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../../resources/css/styles.css" rel="stylesheet" />
        <!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
	</head>
    <body>
    	
    	
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="home.jsp">#HEALTH</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../home.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="./listPageSearch?num=1">자유게시판</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/board/write">게시글 작성</a></li>
                       <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/board/login">로그인</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../../resources/assets/img/deadlift.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Do it now </h1>
                            <span class="subheading">오늘 끝나고 뭐하시나요?</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <div class="container">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>작성자</th>
								<th>조회수</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${list}" var="list">
								<tr>
									<td>${list.bno}</td>
									<td><a href="/board/view?bno=${list.bno}">${list.title}</a>
									</td>
									<td><fmt:formatDate value="${list.regDate}"
											pattern="yyyy-MM-dd" /></td>
									<td>${list.writer}</td>
									<td>${list.viewCnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div >
						<button type="button" class="btn btn-default" id="writeBtn">작성</button>	
					
					</div>
					<div>
						<div class="col-md-offset-3">	
						<ul>
						<c:if test="${page.prev}">
							<span> [<a href="/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>]
							</span>
						</c:if>

						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
							var="num">
							<span> <c:if test="${select != num}">
									<a
										href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
								</c:if> <c:if test="${select == num}">
									<b>${num}</b>
								</c:if>

							</span>
						</c:forEach>

						<c:if test="${page.next}">
							<span>[ <a
href="/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
								]
							</span>
						</c:if>
						</ul>
						</div>
						<div class="search row">
						<div class="col-xs2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="title"
									<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
								<option value="content"
									<c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
								<option value="title_content"
									<c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
								<option value="writer"
									<c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
							</select> 
							</div>

						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
							<input type="text" name="keyword" value="${page.keyword}" class="form-control"/>
						<span class="input-group-btn">
							<button type="button" class="btn btn-default" id="searchBtn">검색</button>
						</span>
							</div>
							</div>
						</div>
					</div>
				</div>
	<!-- Footer-->
        <footer class="border-top">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <ul class="list-inline text-center">
                            <li class="list-inline-item">
                                <a href="#!">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#!">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#!">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                        </ul>
                        <div class="small text-center text-muted fst-italic">Copyright &copy; KIM UJUNG</div>
                    </div>
                </div>
            </div>
         
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../../resources/js/scripts.js"></script>
        <script>

	 document.getElementById("searchBtn").onclick = function () {
	    
		  let searchType = document.getElementsByName("searchType")[0].value;
		  let keyword =  document.getElementsByName("keyword")[0].value;
		  
		  location.href = "/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	 };
</script>
    </body>
</html>





	
	