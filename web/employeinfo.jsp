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
    ResultSet rs2 = null;
    ResultSet rs_jiangfa = null;
    ResultSet rs_wage = null;
    ResultSet rs_attendance = null;
    if(rs.next()){
        ename = rs.getString("ename");
        //调动履历
        stmt = con.createStatement();
        rs2 = stmt.executeQuery("select * from histories where employe_id="+rs.getString("id"));
        //奖罚
        stmt = con.createStatement();
        rs_jiangfa = stmt.executeQuery("select * from rewards where employe_id="+rs.getString("id"));
        stmt = con.createStatement();
        rs_wage = stmt.executeQuery("select * from wages where  employe_id="+rs.getString("id"));
        stmt = con.createStatement();
        rs_attendance = stmt.executeQuery("select * from attendances where  employe_id="+rs.getString("id"));
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
				<div class="panel-heading"><a href="#" data-toggle="modal" data-target="#history_edit" id="add_history"><i class="glyphicon glyphicon-plus" /></a>履歴</div>
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
                     <%while(rs2.next()){%>
					  <tr>
                        <td>
                            <a href="#" data-id="<%=rs2.getString("id")%>" class="h_del_btn"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;
                            <a href="#" data-id="<%=rs2.getString("id")%>" class="h_edit_btn"><i class="glyphicon glyphicon-edit" /></a></td>
						<td>00<%=rs2.getString("id")%></td>
						<td class="zw"><%=rs2.getString("zhiwu")%></td>
						<td class="ow"><%=rs2.getString("oworkplace")%></td>
						<td class="nw"><%=rs2.getString("nworkplace")%></td>
						<td class="ch"><%=rs2.getString("changeat")%></td>
						<td class="yy"><%=rs2.getString("diaodongyuanyin")%></td>
					  </tr>	
                      <%}%>
					</tbody>
				  </table>
			</div>
			
			<div class="panel panel-default" style="margin-top:15px;">
				<div class="panel-heading"><a href="#" data-toggle="modal" data-target="#rewards_edit" id="add_reward"><i class="glyphicon glyphicon-plus" /></a>奖励惩罚</div>
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
                        <%while(rs_jiangfa.next()){%>
                        <tr>
                            <td>
                                <a href="#" data-id="<%=rs_jiangfa.getString("id")%>" class="reward_del_btn"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;
                                <a href="#" data-id="<%=rs_jiangfa.getString("id")%>" class="reward_edit_btn"><i class="glyphicon glyphicon-edit" /></a></td>
                            <td class="type"><%=rs_jiangfa.getString("rtype")%></td>
                            <td class="date"><%=rs_jiangfa.getString("enterat")%></td>
                            <td class="yuanyin"><%=rs_jiangfa.getString("yuanyin")%></td>
                            <td class="other"><%=rs_jiangfa.getString("beizhu")%></td>
                        </tr>	
                        <%}%>
					  	  
					</tbody>
				  </table>
			</div>
	</div>
	</div>
	<div class="tab-pane fade" id="kaoqin">
		
	    <div class="panel panel-default" style="margin:15px 0px;">
        <div class="panel-heading">
            <a href="#" data-toggle="modal" data-target="#attendance_edit" id="add_attendance"><i class="glyphicon glyphicon-plus" /></a>
            考勤信息
        </div>
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
                <%while(rs_attendance.next()){%>
                    <tr>
                        <td>
                            <a href="#" data-id="<%=rs_attendance.getString("id")%>" class="attendance_del_btn"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;
                            <a href="#" data-id="<%=rs_attendance.getString("id")%>" class="attendance_edit_btn"><i class="glyphicon glyphicon-edit" /></a></td>
                        <td class="date"><%=rs_attendance.getString("kdate")%></td>
                        <td class="yingdao"><%=rs_attendance.getString("yingdao_t")%></td>
                        <td class="shidao"><%=rs_attendance.getString("shidao_t")%></td>
                        <td class="work"><%=rs_attendance.getString("work_h")%></td>
                        <td class="status"><%=rs_attendance.getString("status")%></td>
                        <td class="qufen"><%=rs_attendance.getString("qufen")%></td>
                    </tr>	
                <%}%>
                
		      
		     
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
        <div class="panel-heading">
            <a href="#" data-toggle="modal" data-target="#wage_edit" id="add_wage">
                <i class="glyphicon glyphicon-plus" />
            </a>
            工资信息
        </div>
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
                <%while(rs_wage.next()){%>
                    <tr>
                        <td>
                            <a href="#" data-id="<%=rs_wage.getString("id")%>" class="wage_del_btn"><i class="glyphicon glyphicon-trash" /></a>&nbsp;&nbsp;
                            <a href="#" data-id="<%=rs_wage.getString("id")%>" class="wage_edit_btn"><i class="glyphicon glyphicon-edit" /></a></td>
                        <td class="date"><%=rs_wage.getString("wdate")%></td>
                        <td class="jiben"><%=rs_wage.getString("wjiben")%></td>
                        <td class="ticheng"><%=rs_wage.getString("wticheng")%></td>
                        <td class="jiangli"><%=rs_wage.getString("wjiangli")%></td>
                        <td class="jiaban"><%=rs_wage.getString("wjiaban")%></td>
                        <td class="other"><%=rs_wage.getString("wother")%></td>
                        <td class="beizhu"><%=rs_wage.getString("beizhu")%></td>
                    </tr>	
                <%}%>
		      
		      
		    </tbody>
		  </table>
	    </div></div>
     </div>
    </div>
</div>

<!-- 履歴 -->
<div class="modal fade" id="history_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">添加履历[<%=rs.getString("ename")%>]</h4>
      </div>
      <div class="modal-body">
          <form role="form">
              <input name="eid" type="hidden" id="e_id" value="<%=rs.getString("id")%>" />
              <input name="m" type="hidden" id="h_method" value="add" />
              <input name="hid" type="hidden" id="h_id" value="0" />
              <div class="form-group">
                <label for="h_zhiwu">职务</label>
                <input type="text" class="form-control" id="h_zhiwu" placeholder="职务">
              </div>
              <div class="form-group">
                <label for="h_oworkplace">旧工作单位</label>
                <input type="text" class="form-control" id="h_oworkplace" placeholder="旧工作单位">
              </div>
              <div class="form-group">
                <label for="h_nworkplace">新工作单位</label>
                <input type="text" class="form-control" id="h_nworkplace" placeholder="新工作单位">
              </div>
              <div class="form-group">
                <label for="h_changeat">调动日期</label>
                <input type="text" class="form-control" id="h_changeat" placeholder="调动日期">
              </div>
              <div class="form-group">
                <label for="e_yuanyin">调动原因</label>
                <textarea class="form-control" rows="3" id="h_yuanyin"></textarea>
              </div>
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-default" id="history_submit_btn">添加</button>
      </div>
    </div>
  </div>
</div>
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
        $("#add_history").click(function(){
            $("#h_method").val("add");
        });
        $("#history_submit_btn").click(function(){
            var dataset = {};
            dataset.employe_id = $("#e_id").val();
            dataset.id = $("#h_id").val();
            dataset.zhiwu = $("#h_zhiwu").val();
            dataset.method = $("#h_method").val();
            dataset.nworkplace = $("#h_nworkplace").val();
            dataset.oworkplace = $("#h_oworkplace").val();
            dataset.changeat = $("#h_changeat").val();
            dataset.yuanyin = $("#h_yuanyin").val();
            for(var i in dataset){
                if(dataset[i]==""){
                    alert("不能为空");return ;
                }
            }
            
            $.ajax({
                type: "POST",
                url: "/UpdateHistory",
                data: dataset,
                dataType:'json'
            }).done(function(re){
                var r = $.extend({status:"error"},re);
                if(r.status == "ok"){
                    $('#history_edit').modal('hide');
                    
                }else{
                    alert(r.msg);
                }
            }).fail(function( jqXHR, textStatus ){
                alert("系统错误。");
            });
        });
        
        $(".h_edit_btn").click(function(){
            var id = $(this).data('id');
            $("#h_method").val("edit");
            $('#history_edit').modal('show');
            $("#h_id").val(id);
            $("#h_zhiwu").val($(".zw",$(this).parents("tr")).text());
            $("#h_oworkplace").val($(".ow",$(this).parents("tr")).text());
            $("#h_nworkplace").val($(".nw",$(this).parents("tr")).text());
            $("#h_changeat").val($(".ch",$(this).parents("tr")).text());
            $("#h_yuanyin").val($(".yy",$(this).parents("tr")).text());
            
        });
       
        $(".h_del_btn").click(function(){
            var id = $(this).data("id");
            var $this = $(this);
            if (confirm("确认删除么")) {
                $.ajax({
                    type: "POST",
                    url: "/UpdateHistory",
                    data: {method:'delete',id:id},
                    dataType:'json'
                }).done(function(re){
                    var r = $.extend({status:"error"},re);
                    if(r.status == "ok"){
                        $this.parents("tr").remove();

                    }else{
                        alert(r.msg);
                    }
                }).fail(function( jqXHR, textStatus ){
                    alert("系统错误。");
                });
            }
            
            
        });
    });
</script>

<!-- 奖罚 -->
<div class="modal fade" id="rewards_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">添加[<%=rs.getString("ename")%>]的奖罚信息</h4>
      </div>
      <div class="modal-body">
          <form role="form">
              <input name="eid" type="hidden" id="reward_e_id" value="<%=rs.getString("id")%>" />
              <input name="m" type="hidden" id="reward_method" value="" />
              <input name="id" type="hidden" id="reward_id" value="0" />
              <div class="form-group">
                <label for="reward_type">奖罚类型</label>
                <input type="text" class="form-control" id="reward_type" placeholder="奖励or惩罚">
              </div>
              <div class="form-group">
                <label for="reward_date">奖惩时间</label>
                <input type="text" class="form-control" id="reward_date" placeholder="奖惩时间">
              </div>
              <div class="form-group">
                <label for="reward_yuanyin">奖惩原因</label>
                <input type="text" class="form-control" id="reward_yuanyin" placeholder="奖惩原因">
              </div>
              <div class="form-group">
                <label for="reward_other">备注</label>
                <input type="text" class="form-control" id="reward_other" placeholder="备注">
              </div>
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-default" id="reward_submit_btn">添加</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
     $(function(){
        $("#reward_submit_btn").click(function(){
            
            var dataset = {};
            dataset.id    = $("#reward_id").val();
            dataset.eid    = $("#reward_e_id").val();
            dataset.method    = $("#reward_method").val();
            dataset.type    = $("#reward_type").val();
            dataset.enterat    = $("#reward_date").val();
            dataset.yuanyin    = $("#reward_yuanyin").val();
            dataset.other    = $("#reward_other").val();
            
            if (dataset.method === "") {
                alert("操作错误");
                return;
            }
            if (dataset.type == "") {
                alert("信息填写不正确");return;
            }
            $.ajax({
                type: "GET",
                url: "/UpdateReward",
                data: dataset,
                dataType:'json'
            }).done(function(re){
                var r = $.extend({status:"error"},re);
                if(r.status == "ok"){
                    $('#reward_edit').modal('hide');
                    
                }else{
                    alert(r.msg);
                }
            }).fail(function( jqXHR, textStatus ){
                alert("系统错误。");
            });
        });
        $("#add_reward").click(function(){
            $("#reward_method").val("add");
        });
        
        
        $(".reward_edit_btn").click(function(){
            var id = $(this).data('id');
            $("#reward_method").val("edit");
            $('#rewards_edit').modal('show');
            $("#reward_id").val(id);
            $("#reward_type").val($(".type",$(this).parents("tr")).text());
            $("#reward_date").val($(".date",$(this).parents("tr")).text());
            $("#reward_yuanyin").val($(".yuanyin",$(this).parents("tr")).text());
            $("#reward_other").val($(".other",$(this).parents("tr")).text());
            
        });
       
        $(".reward_del_btn").click(function(){
            var id = $(this).data("id");
            var $this = $(this);
            if (confirm("确认删除么")) {
                $.ajax({
                    type: "POST",
                    url: "/UpdateReward",
                    data: {method:'delete',id:id},
                    dataType:'json'
                }).done(function(re){
                    var r = $.extend({status:"error"},re);
                    if(r.status == "ok"){
                        $this.parents("tr").remove();

                    }else{
                        alert(r.msg);
                    }
                }).fail(function( jqXHR, textStatus ){
                    alert("系统错误。");
                });
            }
            
            
        });
    });             
</script>
<!-- 考勤 -->
<div class="modal fade" id="attendance_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">添加[<%=rs.getString("ename")%>]的考勤信息</h4>
      </div>
      <div class="modal-body">
          <form role="form">
              <input name="eid" type="hidden" id="attendance_e_id" value="<%=rs.getString("id")%>" />
              <input name="m" type="hidden" id="attendance_method" value="" />
              <input name="id" type="hidden" id="attendance_id" value="0" />
              <div class="form-group">
                <label for="attendance_date">出勤日期</label>
                <input type="text" class="form-control" id="attendance_date" placeholder="2014/03/02">
              </div>
              <div class="form-group">
                <label for="attendance_yingdao">应到时间</label>
                <input type="text" class="form-control" id="attendance_yingdao" placeholder="10:00:00">
              </div>
              <div class="form-group">
                <label for="attendance_shidao">实到时间</label>
                <input type="text" class="form-control" id="attendance_shidao" placeholder="10:00:00">
              </div>
              <div class="form-group">
                <label for="attendance_workh">工作时间</label>
                <input type="text" class="form-control" id="attendance_workh" placeholder="8h">
              </div>
              <div class="form-group">
                <label for="attendance_status">出勤状况</label>
                <input type="text" class="form-control" id="attendance_status" placeholder="加班">
              </div>
              <div class="form-group">
                <label for="attendance_qufen">出勤区分</label>
                <input type="text" class="form-control" id="attendance_qufen" placeholder="普通">
              </div>
              
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-default" id="attendance_submit_btn">添加</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
     $(function(){
        $("#attendance_submit_btn").click(function(){
            
            var dataset = {};
            dataset.id    = $("#attendance_id").val();
            dataset.eid    = $("#attendance_e_id").val();
            dataset.method    = $("#attendance_method").val();
            dataset.date    = $("#attendance_date").val();
            dataset.yingdao    = $("#attendance_yingdao").val();
            dataset.shidao    = $("#attendance_shidao").val();
            dataset.workh    = $("#attendance_workh").val();
            dataset.status    = $("#attendance_status").val();
            dataset.qufen    = $("#attendance_qufen").val();
            
            
            if (dataset.method === "") {
                alert("操作错误");
                return;
            }
            
            $.ajax({
                type: "GET",
                url: "/UpdateAttendance",
                data: dataset,
                dataType:'json'
            }).done(function(re){
                var r = $.extend({status:"error"},re);
                if(r.status == "ok"){
                    $('#attendance_edit').modal('hide');
                    
                }else{
                    alert(r.msg);
                }
            }).fail(function( jqXHR, textStatus ){
                alert("系统错误。");
            });
        });
        $("#add_attendance").click(function(){
            $("#attendance_method").val("add");
        });
        
        
        $(".attendance_edit_btn").click(function(){
            var id = $(this).data('id');
            $("#attendance_method").val("edit");
            $('#attendance_edit').modal('show');
            $("#attendance_id").val(id);
            $("#attendance_date").val($(".date",$(this).parents("tr")).text());
            $("#attendance_yingdao").val($(".yingdao",$(this).parents("tr")).text());
            $("#attendance_shidao").val($(".shidao",$(this).parents("tr")).text());
            $("#attendance_workh").val($(".work",$(this).parents("tr")).text());
            $("#attendance_status").val($(".status",$(this).parents("tr")).text());
            $("#attendance_qufen").val($(".qufen",$(this).parents("tr")).text());
            
            
        });
       
        $(".attendance_del_btn").click(function(){
            var id = $(this).data("id");
            var $this = $(this);
            if (confirm("确认删除么")) {
                $.ajax({
                    type: "POST",
                    url: "/UpdateAttendance",
                    data: {method:'delete',id:id},
                    dataType:'json'
                }).done(function(re){
                    var r = $.extend({status:"error"},re);
                    if(r.status == "ok"){
                        $this.parents("tr").remove();

                    }else{
                        alert(r.msg);
                    }
                }).fail(function( jqXHR, textStatus ){
                    alert("系统错误。");
                });
            }
            
            
        });
    });             
</script>
<!-- 工资 -->
<div class="modal fade" id="wage_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">添加[<%=rs.getString("ename")%>]的工资信息</h4>
      </div>
      <div class="modal-body">
          <form role="form">
              <input name="eid" type="hidden" id="wage_e_id" value="<%=rs.getString("id")%>" />
              <input name="m" type="hidden" id="wage_method" value="" />
              <input name="id" type="hidden" id="wage_id" value="0" />
              <div class="form-group">
                <label for="wage_date">工资添加日期</label>
                <input type="text" class="form-control" id="wage_date" placeholder="工资添加日期">
              </div>
              <div class="form-group">
                <label for="wage_jiben">基本工资</label>
                <input type="text" class="form-control" id="wage_jiben" placeholder="基本工资">
              </div>
              <div class="form-group">
                <label for="wage_ticheng">提成所得</label>
                <input type="text" class="form-control" id="wage_ticheng" placeholder="提成所得">
              </div>
              <div class="form-group">
                <label for="wage_jiangli">奖励所得</label>
                <input type="text" class="form-control" id="wage_jiangli" placeholder="奖励所得">
              </div>
              <div class="form-group">
                <label for="wage_jiaban">加班所得</label>
                <input type="text" class="form-control" id="wage_jiaban" placeholder="加班所得">
              </div>
              <div class="form-group">
                <label for="wage_other">全勤奖励</label>
                <input type="text" class="form-control" id="wage_other" placeholder="全勤奖励">
              </div>
              <div class="form-group">
                <label for="wage_beizhu">其他</label>
                <input type="text" class="form-control" id="wage_beizhu" placeholder="病假，事假，养老保险，过失扣罚">
              </div>
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-default" id="wage_submit_btn">添加</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
     $(function(){
        $("#wage_submit_btn").click(function(){
            
            var dataset = {};
            dataset.id    = $("#wage_id").val();
            dataset.eid    = $("#wage_e_id").val();
            dataset.method    = $("#wage_method").val();
            dataset.date    = $("#wage_date").val();
            dataset.jiben    = $("#wage_jiben").val();
            dataset.ticheng    = $("#wage_ticheng").val();
            dataset.jiangli    = $("#wage_jiangli").val();
            dataset.jiaban    = $("#wage_jiaban").val();
            dataset.other    = $("#wage_other").val();
            dataset.beizhu    = $("#wage_beizhu").val();
            
            if (dataset.method === "") {
                alert("操作错误");
                return;
            }
            if (dataset.date == "" || dataset.jiben == "") {
                alert("信息填写不正确");return;
            }
            $.ajax({
                type: "GET",
                url: "/UpdateWage",
                data: dataset,
                dataType:'json'
            }).done(function(re){
                var r = $.extend({status:"error"},re);
                if(r.status == "ok"){
                    $('#wage_edit').modal('hide');
                    
                }else{
                    alert(r.msg);
                }
            }).fail(function( jqXHR, textStatus ){
                alert("系统错误。");
            });
        });
        $("#add_wage").click(function(){
            $("#wage_method").val("add");
        });
        
        
        $(".wage_edit_btn").click(function(){
            var id = $(this).data('id');
            $("#wage_method").val("edit");
            $('#wage_edit').modal('show');
            $("#wage_id").val(id);
            $("#reward_type").val($(".type",$(this).parents("tr")).text());
            $("#wage_date").val($(".date",$(this).parents("tr")).text());
            $("#wage_jiben").val($(".jiben",$(this).parents("tr")).text());
            $("#wage_ticheng").val($(".ticheng",$(this).parents("tr")).text());
            $("#wage_jiangli").val($(".jiangli",$(this).parents("tr")).text());
            $("#wage_jiaban").val($(".jiaban",$(this).parents("tr")).text());
            $("#wage_other").val($(".other",$(this).parents("tr")).text());
            $("#wage_beizhu").val($(".beizhu",$(this).parents("tr")).text());
            
        });
       
        $(".wage_del_btn").click(function(){
            var id = $(this).data("id");
            var $this = $(this);
            if (confirm("确认删除么")) {
                $.ajax({
                    type: "POST",
                    url: "/UpdateWage",
                    data: {method:'delete',id:id},
                    dataType:'json'
                }).done(function(re){
                    var r = $.extend({status:"error"},re);
                    if(r.status == "ok"){
                        $this.parents("tr").remove();

                    }else{
                        alert(r.msg);
                    }
                }).fail(function( jqXHR, textStatus ){
                    alert("系统错误。");
                });
            }
            
            
        });
    });             
</script>

<%
    stmt.close();
    con.close();
                
} catch (Exception e2) {
    System.out.println("Exception: " + e2.getMessage());
}

%>