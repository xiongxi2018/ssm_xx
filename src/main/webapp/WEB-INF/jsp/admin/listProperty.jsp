<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    $(function(){
        $("#addForm").submit(function(){
            if(checkEmpty("name","属性名称")){
                return false;
            }
            return true;
        });
    });
</script>

<ol class="breadcrumb">
    <li><a href="admin_category_list">所有分类</a></li>
    <li><a href="admin_property_list?cid=${c.id}">${c.name}</a></li>
    <li class="active">属性管理</li>
</ol>

<div class="container">
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>属性名称</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ps}" var="p">
            <tr>


                <td>${p.id}</td>
                <td>${p.name}</td>

                <td><a href="admin_property_edit?id=${p.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                <td><a deletelink="true" href="admin_property_delete?id=${p.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                </c:forEach>
            </tr>
            </tbody>
        </table>
    </div>

    <%@include file="../include/admin/adminPage.jsp" %>

    <div class="panel panel-warning col-sm-4 col-sm-offset-4">
        <div class="panel-heading">
            <h3 class="panel-title">新增属性</h3>
        </div>
        <div class="panel-body">
            <form id="addForm" method="post" action="admin_property_add?cid=${c.id}">
                <div class="form-group">
                    <label>属性名称</label>
                    <input type="hidden" name="cid" value="${c.id}">
                    <input id="name" name="name" type="text" class="form-control">
                </div>

                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </div>

<%@include file="../include/admin/adminFooter.jsp"%>