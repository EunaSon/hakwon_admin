<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 페이지</title>
    <!-- JQUERY -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    
   
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/course/classmanage">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">관리자</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/course/classmanage">
                    
                    <span>강의관리</span></a>
            </li>

            <!-- Divider -->
           

            <!-- Heading -->
            

            <!-- Nav Item - Pages Collapse Menu -->
             <li class="nav-item active">
                <a class="nav-link" href="#"data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseTwo">
                    
                    <span>회원관리</span>
                
                </a>
                  <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        
                        <a class="collapse-item" href="/Admin/list">
                        <i class="fas fa-fw fa-cog"></i>
                         &nbsp회원 리스트</a>
                        <a class="collapse-item" href="/Admin/adminlist">
                        <i class="fas fa-fw fa-cog"></i>
                         &nbsp관리자 리스트</a>
                    </div>
                </div>
               
            </li>

            <!-- Nav Item - 공지사항 Menu -->
             <li class="nav-item active">
                <a class="nav-link" href="/notice/list">
                    
                    <span>공지사항</span>
                </a>
               
            </li>

            <!-- Divider -->
            

            <!-- Heading -->
          

            <!-- Nav Item - Pages Collapse Menu -->
             <li class="nav-item active">
                <a class="nav-link" href="/inquery/list">
                   
                    <span>온라인 상담</span>
                </a>
             
            </li>
			
			<%-- 
            <!-- Nav Item - Charts -->
            <li class="nav-item active">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    
                    <span>수강현황관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        
                        <a class="collapse-item" href="#">
                        <i class="fas fa-fw fa-cog"></i>
                         &nbsp수강현황조회</a>
                        <a class="collapse-item" href="#">
                        <i class="fas fa-fw fa-cog"></i>
                         &nbsp그래프</a>
                    </div>
                </div>
                </li>

            <!-- Nav Item - Tables -->
            --%>
            
          

            <!-- Divider -->
          

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                   <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    
                    
    				
                  
                    
      
                    
                    <ul class="navbar-nav ml-auto">
                   
                    <li>
                   	<a class="logout" href="" data-toggle="modal" data-target="#logoutModal">
                     <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                 Logout
                     </a>
                    </li>           
                    </ul>
                    


                   
                    <!-- Topbar Navbar -->
                    

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                   
                        
                    

                   

                
                     
                    
