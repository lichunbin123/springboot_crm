<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>自定义表格排序(JS)</title>
    <script type="text/javascript" src="jquery-1.4.3.js"></script>
    <script type="text/javascript" src="code.js"></script>
    <style type="text/css">
        * { padding: 0; margin: 0; }
        body { font-family: verdana; font-size: 12px; }
        .content { width: 550px; margin: 20px auto; }
        .content h1 { font-family: '微软雅黑'; font-size: 18px; padding-bottom: 5px; }
        table { width: 100%; }
        th, td { padding: 6px 0; text-align: center; }
        th { background-color: #007D28; color: #ffffff; }
        tr { background-color: #E8FFE8; }
        .odd { background-color: #FFF3EE; }
        .highlight { background-color: #FFF3EE; }

        .arrow {
            display: inline-block;
            vertical-align: middle;
            width: 0;
            height: 0;
            margin-left: 5px;
            opacity: 0.66;
        }

        .arrow.asc {
            border-left: 4px solid transparent;
            border-right: 4px solid transparent;
            border-bottom: 4px solid #fff;
        }

        .arrow.dsc {
            border-left: 4px solid transparent;
            border-right: 4px solid transparent;
            border-top: 4px solid #fff;
        }
    </style>
</head>

<body>
<table summary="user infomation table" id="tableSort">
    <thead>
    <tr>
        <th onclick="$.sortTable.sort('tableSort',0)" style="cursor: pointer;">会员ID<span class="arrow asc"></span><span class="arrow dsc"></span></th>
        <th onclick="$.sortTable.sort('tableSort',1)" style="cursor: pointer;">会员名</th>
        <th>邮箱</th>
        <th onclick="$.sortTable.sort('tableSort',3)" style="cursor: pointer;">会员组</th>
        <th onclick="$.sortTable.sort('tableSort',4)" style="cursor: pointer;">城市</th>
        <th onclick="$.sortTable.sort('tableSort',5)" style="cursor: pointer;">注册时间</th>
        <th onclick="$.sortTable.sort('tableSort',6)" style="cursor: pointer;">score</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>126</td>
        <td>webw3c</td>
        <td>este@126.com</td>
        <td>普通会员</td>
        <td>北京</td>
        <td>2011-04-13</td>
        <td>80</td>
    </tr>
    <tr>
        <td>145</td>
        <td>test001</td>
        <td>test001@126.com</td>
        <td>中级会员</td>
        <td>合肥</td>
        <td>2011-03-27</td>
        <td>9</td>
    </tr>
    <tr>
        <td>116</td>
        <td>wuliao</td>
        <td>wuliao@126.com</td>
        <td>普通会员</td>
        <td>南昌</td>
        <td>2011-04-01</td>
        <td>100.5</td>
    </tr>
    <tr>
        <td>129</td>
        <td>tired</td>
        <td>tired@126.com</td>
        <td>中级会员</td>
        <td>北京</td>
        <td>2011-04-06</td>
        <td>0</td>
    </tr>
    <tr>
        <td>155</td>
        <td>tiredso</td>
        <td>tireds0@126.com</td>
        <td>中级会员</td>
        <td>武汉</td>
        <td>2011-04-06</td>
        <td>1201</td>
    </tr>
    <tr>
        <td>131</td>
        <td>javascript</td>
        <td>js2011@126.com</td>
        <td>中级会员</td>
        <td>武汉</td>
        <td>2011-04-08</td>
        <td>11.5</td>
    </tr>
    <tr>
        <td>132</td>
        <td>jQuery</td>
        <td>jQuery@126.com</td>
        <td>高级会员</td>
        <td>北京</td>
        <td>2011-04-12</td>
        <td>110</td>
    </tr>
    </tbody>
</table>
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
                            if (Idx!==6) {
                                var value1 = tr1.cells[Idx].innerHTML;
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
</script>
</body>
</html>


