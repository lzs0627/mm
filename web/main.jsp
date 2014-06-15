<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="authcheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>人事管理系统</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/datepicker.css" rel="stylesheet">
    <link href="/css/main.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="/js/html5shiv.js"></script>
      <script src="/js/respond.min.js"></script>
    <![endif]-->
    <script>
        var localloaded = "";
        function update_page(){
            setTimeout(function(){
               if (localloaded != "") {
                var dd = new Date();
                $("#page-wrapper").load(localloaded+"?"+dd.getSeconds());
                } 
            },1500);
        }
    </script>
  </head>
  <body>
    <div id="wrapper">
	<nav class="navbar navbar-default navbar-fixed-top" style="margin-bottom: 0">
	    <div class="navbar-header">                
		<a class="navbar-brand" href="#">人事管理系统</a>
	    </div>
	    <ul class="nav navbar-top-links navbar-right">               
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="glyphicon glyphicon-user"></i>  
			<i class="glyphicon glyphicon-chevron-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="glyphicon glyphicon-user"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="/logout"><i class="glyphicon glyphicon-log-out"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
	    <div class="navbar-default navbar-static-side" role="navigation">
                <div class="sidebar-collapse" style="height: 0px;">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-list-alt"></i>人事管理<span class="glyphicon glyphicon-chevron-right arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a href="#newemploye" data-role="loader" data-target="/newemploye.html">添加员工</a>
                                </li>
                                <li>
                                    <a href="#" data-role="loader" data-target="/searchemploye.html">查询员工</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>

                        <li>
                            <a href="#"><i class="glyphicon glyphicon-list-alt"></i> 部門管理<span class="glyphicon glyphicon-chevron-right arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a href="#" data-role="loader" data-target="/neworg.html">添加部门</a>
                                </li>
                                <li>
                                    <a href="#" data-role="loader" data-target="/searcheorg.html">查询部门</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-list-alt"></i> 系统管理<span class="glyphicon glyphicon-chevron-right arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                
                                <li>
                                    <a href="#" data-role="loader" data-target="/newadmin.html">添加管理员</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                    <!-- /#side-menu -->
                </div>
                <!-- /.sidebar-collapse -->
            </div>
	</nav>
	<div id="page-wrapper">
	    
	</div>
	
    </div>
    
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/jquery.metisMenu.js"></script>
    <script>
	$(function () {

//	    $('#side-menu').metisMenu();

	    $('#side-menu').metisMenu({
            toggle: false
	    });
        
        $("body").on('click',"a[data-role='loader']",function(){
            var target = $(this).data("target");
            if(target){
                localloaded = target;
                var dd = new Date();
                $("#page-wrapper").load(target+"?"+dd.getSeconds());
            }
        });
        
	});
    </script>
  </body>
</html>