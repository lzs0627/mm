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
    
    if(rs.next()){
        
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
		<form class="form-horizontal" role="form">
		    <table class="table table-bordered table-condensed">
			<tr>
			    <th class="col-lg-2">部门编号</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("dcode")%>"></td>
			    <th class="col-lg-2">部门名称</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("dname")%>"></td>
			</tr>			
			<tr>
			    <th class="col-lg-2">备注</th>
			    <td colspan="3"><textarea class="form-control" rows="3"><%=rs.getString("description")%></textarea></td>			   
			</tr>
		    </table>
			<div class="">
				 <button type="submit" class="btn btn-default">修改</button>
				  <button type="reset" class="btn btn-default">取消</button>
			</div>
		</form>
	    </div>
	</div>

	<div class="tab-pane fade" id="yuangong">
		<ul class="pagination">
		<li class="disabled"><a href="#">Â«</a></li>
		<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">Â»</a></li>
	     </ul>
	    <div class="list">
		<table class="table table-striped table-bordered table-hover table-condensed">
		    <thead>
				<tr>
					<th>åå·¥ç¼å·</th>
					<th>åå·¥å§å</th>
					<th>æ§å«</th>
					<th>æå±é¨é¨</th>
					<th>å°å²æ¥æ</th>
					<th>èå¡</th>
					<th>å¨èç¶æ</th>
				</tr>
		    </thead>
		    <tbody>
		      <tr>
			  <td><a href="#" data-role="loader" data-target="employeinfo.html"><i class="glyphicon glyphicon-share-alt" />&nbsp;&nbsp;  001</a></td>
			<td>ç°ä¸­æ­£å¼</td>
			<td>ç·</td>
			<td>æè¡é¨</td>
			<td>2001/02.03</td>
			<td>ä¸è¬ç¤¾å¡</td>
			<td>å¨è</td>
		      </tr>
		      <tr>
			<td><a href="#" data-role="loader" data-target="employeinfo.html"><i class="glyphicon glyphicon-share-alt" />&nbsp;&nbsp;  002</a></td>
			<td>åç°ä¸­æ­£</td>
			<td>ç·</td>
			<td>å¶æ¥­é¨</td>
			<td>2001/02.03</td>
			<td>ä¸è¬ç¤¾å¡</td>
			<td>å¨è</td>
		      </tr>
		      <tr>
			<td><a href="#" data-role="loader" data-target="employeinfo.html"><i class="glyphicon glyphicon-share-alt" />&nbsp;&nbsp;  003</a></td>
			<td>å®®å´é§¿</td>
			<td>ç·</td>
			<td>æè¡é¨</td>
			<td>2001/02.03</td>
			<td>ä¸è¬ç¤¾å¡</td>
			<td>å¨è</td>
		      </tr>
		    </tbody>
		  </table>
	    </div>
	    
	    <ul class="pagination">
		<li class="disabled"><a href="#">Â«</a></li>
		<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">Â»</a></li>
	     </ul>
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


<%
    stmt.close();
    con.close();
                
} catch (Exception e2) {
    System.out.println(id+"Exception: " + e2.getMessage());
}

%>