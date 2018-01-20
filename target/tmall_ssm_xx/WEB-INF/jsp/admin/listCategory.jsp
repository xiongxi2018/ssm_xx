<%--
  Created by IntelliJ IDEA.
  User: xiongxi
  Date: 2017/12/9
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<%--<<script>
    $(function(){

        $("#addForm").submit(function(){
            if(!checkEmpty("name","分类名称"))
                return false;
            if(!checkEmpty("categoryPic","分类图片"))
                return false;
            return true;
        });
    });

</script>

<title>分类管理</title>

<div class="workingArea">
    <h1 class="label label-info" >分类管理</h1>
    <br>
    <br>

    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>图片</th>
                <th>分类名称</th>
                <th>属性管理</th>
                <th>产品管理</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cs}" var="c">

                <tr>
                    <td>${c.id}</td>
                    <td><img height="40px" src="img/category/${c.id}.jpg"></td>
                    <td>${c.name}</td>

                    <td><a href="admin_property_list?cid=${c.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                    <td><a href="admin_product_list?cid=${c.id}"><span class="glyphicon glyphicon-shopping-cart"></span></a></td>
                    <td><a href="admin_category_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true" href="admin_category_delete?id=${c.id}"><span class="   glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>

    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增分类</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>分类名称</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>分类圖片</td>
                        <td>
                            <input id="categoryPic" accept="image/*" type="file" name="image" />
                        </td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>--%>
<script>
    $(function(){
        $("#addForm").submit(function(){
            if(!checkEmpty("name","分类名称")){
                return false;
            }
            if(!checkEmpty("categoryPic","分类图片")) {
                return false;
            }
            return true;
        });
    });
</script>

<div class="container">
    <div class="table-responsive">
        <table class="table table-bordered">
            <caption><span class="label label-info">分类管理</span></caption>
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>图片</th>
                <th>分类名称</th>
                <th>属性管理</th>
                <th>产品管理</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cs}" var="c">
            <tr>


                <td>${c.id}</td>
                <td><img height="40px" src="img/category/${c.id}.jpg"></td>
                <td>${c.name}</td>

                <td><a href="admin_property_list?cid=${c.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                <td><a href="admin_product_list?cid=${c.id}"><span class="glyphicon glyphicon-shopping-cart"></span></a></td>
                <td><a href="admin_category_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                <td><a deletelink="true" href="admin_category_delete?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                </c:forEach>
            </tr>
            </tbody>
        </table>
    </div>

    <%@include file="../include/admin/adminPage.jsp" %>

    <div class="panel panel-warning col-sm-4 col-sm-offset-4">
        <div class="panel-heading">
            <h3 class="panel-title">新增分类</h3>
        </div>
        <div class="panel-body">
            <form id="addForm" method="post" action="admin_category_add" enctype="multipart/form-data">
                <div class="form-group">
                    <label>分类名称</label>
                    <input id="name" name="name" type="text" class="form-control">
                </div>

                <div class="form-group">
                    <label>图片</label>
                    <input id="categoryPic" accept="image/*" name="image" type="file">
                </div>

                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </div>

<%@include file="../include/admin/adminFooter.jsp"%>
