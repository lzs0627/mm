<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
try{
    // １．JDBC Driver の登録
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    // ２．データベースへの接続
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mm_db?characterEncoding=utf-8", "root", "123456");
    // ３．SQL ステートメント・オブジェクトの作成
    Statement stmt = con.createStatement();
    // ４．SQL ステートメントの発行
    ResultSet rs = null;
    rs = stmt.executeQuery("select * from departments where id="+id);
    ResultSet rs_e = null;
    if(rs.next()){
        stmt = con.createStatement();
        rs_e = stmt.executeQuery("select e.* from employe as e INNER join department_employe as de "
                + "on e.id=de.employe_id and de.department_id="+id);
    }else{
        
    }
    
                


%>

<div class="row">
    <div class="col-lg-12 " id="mainview">
	<h1 class="page-header"><%=rs.getString("dname")%></h1>
    </div>
    <!-- /.col-lg-12 -->
</div>


<div class="row">
    <div class="col-lg-12">
    <ul class="nav nav-tabs  nav-justified">
	<li class="active"><a href="#jiben" data-toggle="tab">基本信息</a></li>
	<li><a href="#yuangong" data-toggle="tab">职员信息</a></li>
    </ul>	
    <div class="tab-content">
        
	<div class="tab-pane fade in active" id="jiben">
        
	    <div style="padding: 15px;" class="col-lg-offset-2 col-lg-8 clearfix">
            <div class="alert alert-info fade in" id="alert_info">信息修改成功！！<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button></div>
		<form class="form-horizontal" role="form">
            <input type="hidden" id="oid" value="<%=rs.getString("id")%>" />
		    <table class="table table-bordered table-condensed">
			<tr>
			    <th class="col-lg-2">部门编号</th>
			    <td><input type="text" class="form-control" id="dcode" value="<%=rs.getString("dcode")%>"></td>
			    <th class="col-lg-2">部门名称</th>
			    <td><input type="text" class="form-control" id="dname" value="<%=rs.getString("dname")%>"></td>
			</tr>			
			<tr>
			    <th class="col-lg-2">备注</th>
			    <td colspan="3"><textarea class="form-control" id="desc" rows="3"><%=rs.getString("description")%></textarea></td>			   
			</tr>
		    </table>
			<div class="">
				 <button type="button" class="btn btn-default" id="org_edit_btn">修改</button>
				  <button type="reset" class="btn btn-default">取消</button>
			</div>
		</form>
	    </div>
	</div>

	<div class="tab-pane fade" id="yuangong">
		<ul class="pagination">
		<li class="disabled"><a href="#">Prev</a></li>
		<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">Next</a></li>
	     </ul>
	    <div class="list">
		<table class="table table-striped table-bordered table-hover table-condensed">
		    <thead>
				<tr>
				<th>员工编号</th>
                <th>员工姓名</th>
                <th>性别</th>
                <th>到岗日期</th>
                <th>在职状态</th>
				</tr>
		    </thead>
		    <tbody>
            <%while(rs_e.next()){%>
		      <tr>
                  <td><a href="#" data-role="loader" data-target="employeinfo.jsp?ec=<%=rs_e.getString("ecode")%>&">
                          <i class="glyphicon glyphicon-share-alt" />
                          <%=rs_e.getString("ecode")%>
                      </a>
                  </td>
			<td><%=rs_e.getString("ename")%></td>
			<td><%=rs_e.getInt("sex")==1?"男":"女"%></td>
			<td><%=rs_e.getString("workstart")%></td>
			<td><%=rs_e.getString("status")%></td>
		      </tr>
		      <%}%>
		    </tbody>
		  </table>
	    </div>
	    
	    
	</div>
	<div class="tab-pane fade" id="pingjia">
		<div class="list" style="margin-top: 15px;">
		<table class="table table-striped table-bordered table-hover table-condensed">
		    <thead>
		      <tr>
				<th></th>
				<th>èè¯æä»½</th>
				<th>èè¯ç­çº§</th>
				<th>èè¯äºº</th>
				<th>èè¯ç»æ</th>
				<th>èè¯åæ°</th>
				<th>å¤æ³¨</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
			    <td><a href="#"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;<a href="#"><i class="glyphicon glyphicon-edit" /></a></td>
				<td>2014/04</td>
				<td>2ç­</td>
				<td>admin</td>
				<td>good</td>
				<td>80</td>
				<td>not so bad</td>
		      </tr>
		      <tr>
				<td><a href="#"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;<a href="#"><i class="glyphicon glyphicon-edit" /></a></td>
				<td>2014/04</td>
				<td>2ç­</td>
				<td>admin</td>
				<td>good</td>
				<td>80</td>
				<td>not so bad</td>
		      </tr>
		      <tr>
				<td><a href="#"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;<a href="#"><i class="glyphicon glyphicon-edit" /></a></td>
				<td>2014/04</td>
				<td>2ç­</td>
				<td>admin</td>
				<td>good</td>
				<td>80</td>
				<td>not so bad</td>
		      </tr>
		    </tbody>
		  </table>
	    </div></div>
	<div class="tab-pane fade" id="gongzi">
		<div class="list" style="margin-top: 15px;">
		<table class="table table-striped table-bordered table-hover table-condensed">
		    <thead>
		      <tr>
				<th></th>
				<th>èå¤æä»½</th>
				<th>åºæ¬å·¥èµ</th>
				<th>éå®ææ</th>
				<th>å¥å±</th>
				<th>å ç­å·¥èµ</th>
				<th>å¨å¤å¥</th>
				<th>å¶ä»ï¼çåï¼äºåï¼å»èä¿é©ï¼è¿å¤±æ£ç½ï¼</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
			    <td><a href="#"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;<a href="#"><i class="glyphicon glyphicon-edit" /></a></td>
				<td>2014/04</td>
				<td>4500</td>
				<td>300</td>
				<td>300</td>
				<td>300</td>
				<td>100</td>
				<td>100</td>
		      </tr>
		      <tr>
				<td><a href="#"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;<a href="#"><i class="glyphicon glyphicon-edit" /></a></td>
				<td>2014/04</td>
				<td>4500</td>
				<td>300</td>
				<td>300</td>
				<td>300</td>
				<td>100</td>
				<td>100</td>
		      </tr>
		      <tr>
				<td><a href="#"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;<a href="#"><i class="glyphicon glyphicon-edit" /></a></td>
				<td>2014/04</td>
				<td>4500</td>
				<td>300</td>
				<td>300</td>
				<td>300</td>
				<td>100</td>
				<td>100</td>
		      </tr>
		    </tbody>
		  </table>
	    </div></div>
     </div>
    </div>
</div>
<script type="text/javascript">
     $(function(){
         $(".alert").hide()
        $("#org_edit_btn").click(function(){
            
            var dataset = {};
            dataset.id    = $("#oid").val();
            dataset.code    = $("#dcode").val();
            dataset.name    = $("#dname").val();
            dataset.desc    = $("#desc").val();
            
            
            if (dataset.id == "" || dataset.code == "" || dataset.name == "" || dataset.desc == "") {
                alert("信息填写不正确");return;
            }
            $.ajax({
                type: "GET",
                url: "/UpdateOrg",
                data: dataset,
                dataType:'json'
            }).done(function(re){
                var r = $.extend({status:"error"},re);
                if(r.status == "ok"){
                    $(".alert").show();
                    //update_page();
                }else{
                    alert(r.msg);
                }
            }).fail(function( jqXHR, textStatus ){
                alert("系统错误。");
            });
        });
        
            
    });             
</script>


<%
    stmt.close();
    con.close();
                
} catch (Exception e2) {
    System.out.println(id+"Exception: " + e2.getMessage());
}

%>