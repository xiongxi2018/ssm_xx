<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>

    $(function() {
        $("#addForm").submit(function() {
            if (!checkEmpty("name", "产品名称"))
                return false;
            if (!checkNumber("originalPrice", "原价格"))
                return false;
            if (!checkNumber("promotePrice", "优惠价格"))
                return false;
            if (!checkInt("stock", "库存"))
                return false;
            return true;
        });
    });

</script>

<ol class="breadcrumb">
    <li><a href="admin_category_list">所有分类</a></li>
    <li><a href="admin_product_list?cid=${p.category.id}">${p.category.name}</a></li>
    <li class="active">${p.name}</li>
    <li class="active">编辑产品</li>
</ol>

<div class="panel panel-warning col-sm-4 col-sm-offset-4">
    <div class="panel-heading">
        <h3 class="panel-title">编辑产品</h3>
    </div>
    <div class="panel-body">
        <form id="addForm" method="post" action="admin_product_update">
            <input name="id" type="hidden" value="${p.id}">
            <input name="cid" type="hidden" value="${p.category.id}">
            <div class="form-group">
                <label>产品名称</label>
                <input id="name" name="name" type="text" class="form-control" value="${p.name}">
            </div>
            <div class="form-group">
                <label>产品小标题</label>
                <input id="subTitle" name="subTitle" type="text" class="form-control" value="${p.subTitle}">
            </div>
            <div class="form-group">
                <label>原价格</label>
                <input id="originalPrice" name="originalPrice" type="text" class="form-control" value="${p.originalPrice}">
            </div>
            <div class="form-group">
                <label>优惠价格</label>
                <input id="promotePrice" name="promotePrice" type="text" class="form-control" value="${p.promotePrice}">
            </div>
            <div class="form-group">
                <label>库存</label>
                <input id="stock" name="stock" type="text" class="form-control" value="${p.stock}">
            </div>
            <button type="submit" class="btn btn-default">提交</button>
        </form>
    </div>
</div>

<%@include file="../include/admin/adminFooter.jsp"%>