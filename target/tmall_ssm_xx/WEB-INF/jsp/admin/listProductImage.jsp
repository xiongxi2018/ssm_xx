<%--
  Created by IntelliJ IDEA.
  User: xiongxi
  Date: 2018/1/13
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    $(function(){
        $("#addFormSingle").submit(function(){
            if(checkEmpty("filepathSingle","图片文件")) {
                $("#filepathSingle").value("");
                return true;
            }
            return false;
        });
        $("#addFormDetail").submit(function(){
            if(checkEmpty("filepathDetail","图片文件")) {
                return true;
            }
            return false;
        });
    });
</script>

<ol class="breadcrumb">
    <li><a href="admin_category_list">所有分类</a></li>
    <li><a href="admin_product_list?cid=${p.category.id}">${p.category.name}</a></li>
    <li>${p.name}</li>
    <li class="active">产品图片管理</li>
</ol>

<div class="container">
    <div class="col-sm-6">
        <div class="row">
            <div class="panel panel-warning col-sm-8">
                <div class="panel-heading">
                    <h3 class="panel-title">新增产品<span class="text-primary">单个</span>图片</h3>
                </div>
                <div class="panel-body">
                    <form id="addFormSingle" method="post" action="admin_productImage_add" enctype="multipart/form-data">
                        <input type="hidden" name="pid" value="${p.id}">
                        <input type="hidden" name="type" value="type_single">
                        <div class="form-group">
                            <label>请选择本地图片 尺寸400*400为佳</label>
                            <input id="filepathSingle" name="image" type="file">
                        </div>

                        <button type="submit" class="btn btn-success">提交</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="table-responsive col-sm-8">
                <table class="table table-bordered">
                    <caption>图片管理</caption>
                    <thead>
                    <tr class="success">
                        <td>ID</td>
                        <td>单个产品图片缩略图</td>
                        <td>删除</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pisSingle}" var="pi">
                        <tr>
                            <td>${pi.id}</td>
                            <td><a title="点击查看原图" href="img/productSingle/${pi.id}.jpg"><img height="50px" src="img/productSingle/${pi.id}.jpg"></a></td>
                            <td><a deleteLinkk="true" href="admin_productImage_delete?id=${pi.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-sm-6">
        <div class="row">
            <div class="panel panel-warning col-sm-8">
                <div class="panel-heading">
                    <h3 class="panel-title">新增产品<span class="text-primary">详情</span>图片</h3>
                </div>
                <div class="panel-body">
                    <form id="addFormDetail" method="post" action="admin_productImage_add" enctype="multipart/form-data">
                        <input type="hidden" name="pid" value="${p.id}">
                        <input type="hidden" name="type" value="type_detail">
                        <div class="form-group">
                            <label>请选择本地图片 宽度790最好</label>
                            <input id="filepathDetail" name="image" type="file">
                        </div>

                        <button type="submit" class="btn btn-success">提交</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="table-responsive col-sm-8">
                <table class="table table-bordered">
                    <caption>图片管理</caption>
                    <thead>
                    <tr class="success">
                        <td>ID</td>
                        <td>单个产品图片缩略图</td>
                        <td>删除</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pisDetail}" var="pd">
                        <tr>
                            <td>${pd.id}</td>
                            <td><a title="点击查看原图" href="img/productDetail/${pd.id}.jpg"><img height="50px" src="img/productDetail/${pd.id}.jpg"></a></td>
                            <td><a deleteLinkk="true" href="admin_productImage_delete?id=${pd.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/admin/adminFooter.jsp"%>