<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://page.way2a.com/tag" prefix="pager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>信工院复试成绩表</title>
<script src="/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/layer-v3.1.1/layer/layer.js"></script>

<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${pageContext.request.contextPath }/css/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="${pageContext.request.contextPath }/css/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath }/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath }/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/boot-crm.css"
	rel="stylesheet" type="text/css">
</head>

<body>
		<div id="page-wrapper">
		<div style="float: left">
			<form class="excel" enctype="multipart/form-data"
				action="${pageContext.request.contextPath }/excel/import.action"
				method="post">
				导入excel表: <input type="file" name="file"> <input
					type="submit"  value="导入">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			</form>
		</div>
		<div style="float: left">
			<a href="javascript:void(0)" onclick="out()">将成绩排名Excel文件导出</a>

		</div>
		<br />
		<div style="clear:left">
		<button onclick="deleteList()">删除所选</button>
		<button onclick="updateList()">修改所选</button>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">复试成绩管理</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped" id="tableSort">
						<thead>
							<tr>
								<th><input type="checkbox" name="ids" value="" id="check01" onclick="checkAll()" /></th>
								<th onclick="$.sortTable.sort('tableSort',0)" style="cursor: pointer;"><span class="arrow asc">ID</span></th>
								<th>考生类型</th>
								<th onclick="$.sortTable.sort('tableSort',1)" style="cursor: pointer;"><span class="arrow asc">考生编号</span></th>
								<th>学院代码</th>
								<th>学院名称</th>
								<th>专业代码</th>
								<th>专业名称</th>
								<th>姓名</th>
								<th>政治理论</th>
								<th>外国语</th>
								<th>专业课一</th>
								<th>专业课二</th>
								<th onclick="$.sortTable.sort('tableSort',2)" style="cursor: pointer;"><span class="arrow asc">初试成绩</span></th>
								<th>笔试成绩</th>
								<th>面试成绩</th>
								<th>口语成绩</th>
								<th>复试成绩</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${scoreList}" var="score">
								<tr>
									<td><input type="checkbox" class="cb" name="cbname" value="${score.ksbh}"/></td>
									<td>${score.bmddm}</td>
									<td>${score.kslx}</td>
									<td>${score.ksbh}</td>
									<td>${score.bkyxsm}</td>
									<td>${score.bkyxsmc}</td>
									<td>${score.bkzydm}</td>
									<td>${score.bkzymc}</td>
									<td>${score.xm}</td>
									<td>${score.zzll}</td>
									<td>${score.wgy}</td>
									<td>${score.ywk1}</td>
									<td>${score.ywk2}</td>
									<td>${score.cszf}</td>
									<td><input name="bss" value="${score.bs}"></input></td>
									<td><input name="mss" value="${score.ms}"></input></td>
									<td>${score.ky}</td>
									<td>${score.fs}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#customerEditDialog"
										onclick="editSingle(${score.ksbh})">修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteSingle(${score.ksbh})">删除</a>
										</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div>
				 <pager:page pageSize="20" pageNo="${pageNo}" url="/login.action" totalRecord="${totalRecord}"/>
					</div>
				</div>
			</div>
		</div>
	</div>


	</div>
	<!-- 客户编辑对话框 -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改学生成绩</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						<input type="hidden" id="ksbh" name="ksbh" />
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">笔试成绩</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="bs"
									placeholder="笔试成绩" name="bs">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">面试成绩</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="ms"
									placeholder="面试成绩" name="ms">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateSingle()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/metisMenu.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/dataTables.bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/sb-admin-2.js"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
        (function($){
            //插件
            $.extend($,{
                //命名空间
                sortTable:{
                    sort:function(tableId,Idx){
                        var table = document.getElementById(tableId);
                        var tbody = table.tBodies[0];
                        var tr = tbody.rows;

                        var trValue = new Array();
                        for (var i=0; i<tr.length; i++ ) {
                            trValue[i] = tr[i];  //将表格中各行的信息存储在新建的数组中
                        }

                        if (tbody.sortCol == Idx) {
                            trValue.reverse(); //如果该列已经进行排序过了，则直接对其反序排列
                        } else {
                            //trValue.sort(compareTrs(Idx));  //进行排序
                            trValue.sort(function(tr1, tr2){
                                if (Idx!==2) {
                                    var value1 = tr1.cells[Idx].innerHTML;
                                    console.log("value1 ====" + value1);
                                    console.log("value1 type ===" + typeof(value1));
                                    var value2 = tr2.cells[Idx].innerHTML;
                                    return value1.localeCompare(value2);
                                }
                                else{
                                    var value1 = tr1.cells[Idx].innerHTML;
                                    var value2 = tr2.cells[Idx].innerHTML;
                                    if ((value1-value2)<0){
                                        return -1;
                                    }else if ((value1-value2)>0){
                                        return 1;
                                    } else{
                                        return 0;
                                    }
                                }
                            });
                        }
                        var fragment = document.createDocumentFragment();  //新建一个代码片段，用于保存排序后的结果
                        for (var i=0; i<trValue.length; i++ ) {
                            fragment.appendChild(trValue[i]);
                        }
                        tbody.appendChild(fragment); //将排序的结果替换掉之前的值
                        tbody.sortCol = Idx;
                    }
                }
            });
        })(jQuery);

		function editSingle(ksbh) {
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath }/student/edit.action",
				data:{"ksbh":ksbh},
				success:function(data) {
					$("#ksbh").val(data.ksbh);
					$("#bs").val(data.bs);
					$("#ms").val(data.ms);
				}
			});
		}
		//serialize将表单数据序列化
		function updateSingle() {
			$.post("${pageContext.request.contextPath }/student/update.action",$("#edit_customer_form").serialize(),function(data){
				layer.msg("修改成功！");
				window.location.reload();
			});
		}
		 $(function(){
         	$("#check01").click(function(){
         		//prop方法是元素属性设置方法  在1.8版本之前可以用attr方法
         		$(".cb").prop("checked",this.checked);
         	});
         });

		function deleteList(){
			   obj = document.getElementsByName("cbname");
			    ksbhs = [];
			    for(k in obj){
			        if(obj[k].checked)
			        	ksbhs.push(obj[k].value);
			    }

			    layer.confirm('确定删除这'+ksbhs.length+'记录吗',{
					btn:['确定','取消']
				},function()
				{
					/* 关闭提示框 */
					layer.closeAll('dialog');
					$.ajax({
						type:"get",
						url:"${pageContext.request.contextPath }/student/deleteList.action",
						data:{"ksbhs":ksbhs},
						success:function(data) {
							layer.msg("学生删除成功！");
							window.location.reload();
						}
					});
				}
				)
		}
		function updateList(){
			obj1=  document.getElementsByName("bss");
			obj2=  document.getElementsByName("mss");
			obj = document.getElementsByName("cbname");
			    ksbhs = [];
			    for(k in obj){
			        if(obj[k].checked)
			        	ksbhs.push(obj[k].value+","+obj1[k].value+","+obj2[k]);
			    }
			    layer.confirm('确定修改这'+ksbhs.length+'记录吗',{
					btn:['确定','取消']
				},function()
				{
					/* 关闭提示框 */
					layer.closeAll('dialog');
					$.ajax({
						type:"get",
						url:"${pageContext.request.contextPath }/student/updateList.action",
						data:{"ksbhs":ksbhs},
						success:function(data) {
							layer.msg("学生信息修改成功！");
							window.location.reload();
						}
					});
				}
				)
		}
		function deleteSingle(ksbh) {
			layer.confirm('确定删除此条记录吗',{
				btn:['确定','取消']
			},function()
			{
				/* 关闭提示框 */
				layer.closeAll('dialog');
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath }/student/deleteSingle.action",
					data:{"ksbh":ksbh},
					success:function(data) {
						layer.msg("学生删除成功！");
						window.location.reload();
					}
				});
			}
			)
		}

	</script>

</body>

</html>
