<%--
  Created by IntelliJ IDEA.
  User: xiongxi
  Date: 2018/1/12
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<ol class="breadcrumb">
    <li><a href="admin_category_list">所有分类</a></li>
    <li><a href="admin_property_list?cid=${c.id}">${c.name}</a></li>
    <li class="active">编辑属性</li>
</ol>

<div class="panel panel-warning col-sm-4 col-sm-offset-4">
    <div class="panel-heading">
        <h3 class="panel-title">编辑属性</h3>
    </div>
    <div class="panel-body">
        <form id="addForm" method="post" action="admin_property_update">
            <div class="form-group">
                <label>属性名称</label>
                <input name="id" type="hidden" value="${p.id}">
                <input name="cid" type="hidden" value="${p.cid}">
                <input id="name" name="name" type="text" class="form-control" value="${p.name}">
            </div>

            <button type="submit" class="btn btn-default">提交</button>
        </form>
    </div>
</div>

<%@include file="../include/admin/adminFooter.jsp"%>