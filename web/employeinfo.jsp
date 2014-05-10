<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>


<%
request.setCharacterEncoding("utf-8");
String ecode = request.getParameter("ec");
String ename = "";

try{
    // １．JDBC Driver の登録
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    // ２．データベースへの接続
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mm_db?characterEncoding=utf-8", "root", "123456");
    // ３．SQL ステートメント・オブジェクトの作成
    Statement stmt = con.createStatement();
    // ４．SQL ステートメントの発行
    ResultSet rs = null;
    rs = stmt.executeQuery("select * from employe where ecode='"+ecode+"'");
                
    // ５．結果の出力
    
    if(rs.next()){
        ename = rs.getString("ename");
    }else{
        
    }
    
                


%>

<div class="row">
    <div class="col-lg-12 " id="mainview">
	<h1 class="page-header">
<%=rs.getString("ename")%>
    </h1>
    </div>
    <!-- /.col-lg-12 -->
</div>


<div class="row">
    <div class="col-lg-12">
    <ul class="nav nav-tabs  nav-justified">
	<li class="active"><a href="#jiben" data-toggle="tab">基本信息</a></li>
	<li><a href="#dangan" data-toggle="tab">档案管理</a></li>
	<li><a href="#kaoqin" data-toggle="tab">考勤管理</a></li>
	<li><a href="#pingjia" data-toggle="tab">评价管理</a></li>
	<li><a href="#gongzi" data-toggle="tab">工资管理</a></li>
    </ul>	
    <div class="tab-content">
	<div class="tab-pane fade in active" id="jiben">
	    <div style="padding: 15px;" class="col-lg-offset-2 col-lg-8 clearfix">
		<form class="form-horizontal" role="form">
            <input type="hidden" id="eid" value="<%=rs.getInt("id")%>" />
		    <table class="table table-bordered table-condensed">
			<tr>
			    <th class="col-lg-2">员工编号</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("ecode")%>" id="ecode"></td>
			    <th class="col-lg-2">员工姓名</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("ename")%>" id="ename"></td>
			</tr>
			<tr>
			    <th class="col-lg-2">民族</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("ethnic")%>" id="ethnic"></td>
			    <th class="col-lg-2">性别</th>
			    <td><input type="text" class="form-control" value="<%=rs.getInt("sex")%>" id="sex"></td>
			</tr>
			<tr>
			    <th class="col-lg-2">出生年月</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("birthday")%>" id="birthday"></td>
			    <th class="col-lg-2">文化成都</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("wenhua")%>" id="wenhua"></td>
			</tr>
			<tr>
			    <th class="col-lg-2">身份证号</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("uid")%>" id="uid"></td>
			    <td colspan="2"></td>
			</tr>
			<tr>
			    <th class="col-lg-2">婚姻状况</th>
			    <td>
				<input type="text" class="form-control" value="<%=rs.getString("hunyin")%>" id="hunyin">
			    </td>
			    <th class="col-lg-2">籍贯</th>
			    <td>
				<input type="text" class="form-control" value="<%=rs.getString("jiguan")%>" id="jiguan"></td>
			</tr>
			<tr>
			    <th class="col-lg-2">所属部门</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("bumen")%>" id="bumen"></td>
			    <th class="col-lg-2">联系电话</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("tell")%>" id="tell"></td>
			</tr>
			<tr>
			    <th class="col-lg-2">到岗日期</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("workstart")%>" id="workstart"></td>
			    <th class="col-lg-2">离岗日期</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("workleave")%>" id="workleave"></td>
			</tr>
			<tr>
			    <th class="col-lg-2">职务</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("zhiwu")%>" id="zhiwu"></td>
			    <th class="col-lg-2">在职状态</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("status")%>" id="status"></td>
			</tr>
			<tr>
			    <th class="col-lg-2">工资银行</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("bankname")%>" id="bankname"></td>
			    <th class="col-lg-2">工资卡号</th>
			    <td><input type="text" class="form-control" value="<%=rs.getString("bankno")%>" id="bankno"></td>
			</tr>
			<tr>
			    <th class="col-lg-2">备注</th>
			    <td colspan="3"><textarea class="form-control" rows="3" id="description"><%=rs.getString("description")%></textarea></td>			   
			</tr>
		    </table>
			<div>
				 <button type="button" class="btn btn-default" id="submit_btn_e">修改</button>
				 <button type="reset" class="btn btn-default">重置</button>
			</div>
		</form>
	    </div>
	</div>
            
	<div class="tab-pane fade" id="dangan">
		<div class="results" style="padding:15px 0px;">
			<div class="panel panel-default">
				<div class="panel-heading"><a href="#"><i class="glyphicon glyphicon-plus" /></a>履歴</div>
				<table class="table table-striped table-bordered table-hover table-condensed">
					<thead>
					  <tr>
					<th></th>
					<th>调动编号</th>
					<th>职务</th>
					<th>旧单位名称</th>
					<th>新单位名称</th>
					<th>调动日期</th>
					<th>调动原因</th>
					  </tr>
					</thead>
					<tbody>
					  <tr>
						<td><a href="#"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;<a href="#"><i class="glyphicon glyphicon-edit" /></a></td>
						<td>00001</td>
						<td>无</td>
						<td>摆渡公司</td>
						<td>中兴公司</td>
						<td>2010/02/01</td>
						<td>ddddd</td>
					  </tr>				  
					</tbody>
				  </table>
			</div>
			
			<div class="panel panel-default" style="margin-top:15px;">
				<div class="panel-heading"><a href="#"><i class="glyphicon glyphicon-plus" /></a>奖励惩罚</div>
				<table class="table table-striped table-bordered table-hover table-condensed">
					<thead>
					  <tr>
					<th></th>
					<th>奖罚类型</th>
					<th>奖罚时间</th>
					<th>奖罚原因</th>
					<th>备注</th>
					  </tr>
					</thead>
					<tbody>
					  <tr>
						<td><a href="#"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;<a href="#"><i class="glyphicon glyphicon-edit" /></a></td>
						<td>奖励</td>
						<td>2001/02/03</td>
						<td>原因</td>
						<td>备注</td>
					  </tr>	
									  
					</tbody>
				  </table>
			</div>
	</div>
	</div>
	<div class="tab-pane fade" id="kaoqin">
		<ul class="pagination">
		<li class="disabled"><a href="#">Â«</a></li>
		<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">»</a></li>
	     </ul>
	    <div class="list">
		<table class="table table-striped table-bordered table-hover table-condensed">
		    <thead>
		      <tr>
			<th></th>
			<th>考勤日期</th>
			<th>应到</th>
			<th>实到</th>
			<th>工作时间</th>
			<th>出勤状况</th>
			<th>出勤区分</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
			    <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a>&nbsp;&nbsp;<a href="#"><i class="glyphicon glyphicon-edit"></i></a></td>
				<td>2014/04/01</td>
				<td>10:00:00</td>
				<td>18:00:00</td>
				<td>8H</td>
				<td>加班</td>
				<td>普通</td>
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
		<li><a href="#">»</a></li>
	     </ul>
	</div>
	<div class="tab-pane fade" id="pingjia">
		<div class="list" style="margin-top: 15px;">
		<table class="table table-striped table-bordered table-hover table-condensed">
		    <thead>
		      <tr>
				<th></th>
				<th>考评月份</th>
				<th>考评等级</th>
				<th>考评人</th>
				<th>考评结果</th>
				<th>考评分数</th>
				<th>备注</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
			    <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a>&nbsp;&nbsp;<a href="#"><i class="glyphicon glyphicon-edit"></i></a></td>
				<td>2014/04</td>
				<td>2等</td>
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
				<th>考勤月份</th>
				<th>基本工资</th>
				<th>销售提成</th>
				<th>奖励</th>
				<th>加班工资</th>
				<th>全勤奖</th>
				<th>其他（病假，事假，养老保险，过失扣罚）</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
			    <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a>&nbsp;&nbsp;<a href="#"><i class="glyphicon glyphicon-edit"></i></a></td>
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
    System.out.println("Exception: " + e2.getMessage());
}

%>

<script>
    $(function(){
        $("#submit_btn_e").click(function(){
            
            var dataset = {};
            dataset.id    = $("#eid").val();
            dataset.ecode = $("#ecode").val();
            dataset.ename = $("#ename").val();
            dataset.uid     = $("#uid").val();
            dataset.sex     = $("#sex").val();
            dataset.ethnic  = $("#ethinc").val();
            dataset.birthday= $("#birthday").val();
            dataset.wenhua  = $("#wenhua").val();
            dataset.hunyin  = $("#hunyin").val();
            dataset.jiguan  = $("#jiguan").val();
            dataset.bumen   = $("#bumen").val();
            dataset.tell    = $("#tell").val();
            dataset.workstart = $("#workstart").val();
            dataset.workleave = $("#workleave").val();
            dataset.zhiwu     = $("#zhiwu").val();
            dataset.status    = $("#status").val();
            dataset.bankname  = $("#bankname").val();
            dataset.bankno    = $("#bankno").val();
            dataset.desc      = $("#description").val();
            
//            for(var i in dataset){
//                if(dataset[i]==""){
//                    alert(i+" cannt empty.");return ;
//                }
//            }
            
            $.ajax({
                type: "GET",
                url: "/UpdateEmploye",
                data: dataset,
                dataType:'json'
            }).done(function(re){
                var r = $.extend({status:"error"},re);
                if(r.status == "ok"){
                    alert("更新成功");
                }else{
                    alert("更新失败");
                }
            }).fail(function( jqXHR, textStatus ){
                alert("系统错误。");
            });
        });
    });
</script>