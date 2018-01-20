<%--
  Created by IntelliJ IDEA.
  User: xiongxi
  Date: 2018/1/11
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
            pageEncoding="UTF-8" import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<ol class="breadcrumb">
    <li><a href="admin_category_list">所有分类</a></li>
    <li class="active">编辑分类</li>
</ol>

<div class="panel panel-warning col-sm-4 col-sm-offset-4">
    <div class="panel-heading">
        <h3 class="panel-title">新增分类</h3>
    </div>
    <div class="panel-body">
        <form id="addForm" method="post" action="admin_category_update" enctype="multipart/form-data">
            <input name="id" type="hidden" value="${c.id}">
            <div class="form-group">
                <label>分类名称</label>
                <input id="name" name="name" type="text" class="form-control" value="${c.name}">
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
