<%--
  Created by IntelliJ IDEA.
  User: xiongxi
  Date: 2018/1/13
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
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
  <li><a href="admin_product_list?cid=${c.id}">${c.name}</a></li>
  <li class="active">产品管理</li>
</ol>

<div class="container">
  <div class="table-responsive">
    <table class="table table-bordered">
      <thead>
      <tr class="success">
        <th>ID</th>
        <th>图片</th>
        <th>产品名称</th>
        <th>产品小标题</th>
        <th>原价格</th>
        <th>优惠价格</th>
        <th>库存数量</th>
        <th>图片管理</th>
        <th>设置属性</th>
        <th>编辑</th>
        <th>删除</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${ps}" var="p">
      <tr>


        <td>${p.id}</td>
        <c:if test="${!empty p.firstproductImage}">
        <td><img height="40px" src="img/productSingle/${p.firstproductImage.id}.jpg"></td>
        </c:if>
        <c:if test="${empty p.firstproductImage}">
          <td><img height="40px"></td>
        </c:if>
        <td>${p.name}</td>
        <td>${p.subTitle}</td>
        <td>${p.originalPrice}</td>
        <td>${p.promotePrice}</td>
        <td>${p.stock}</td>

        <td><a href="admin_productImage_list?pid=${p.id}"><span class="glyphicon glyphicon-picture"></span></a></td>
        <td><a href="admin_propertyValue_edit?pid=${p.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
        <td><a href="admin_product_edit?id=${p.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
        <td><a deletelink="true" href="admin_product_delete?id=${p.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
        </c:forEach>
      </tr>
      </tbody>
    </table>
  </div>

  <%@include file="../include/admin/adminPage.jsp" %>

  <div class="panel panel-warning col-sm-4 col-sm-offset-4">
    <div class="panel-heading">
      <h3 class="panel-title">新增产品</h3>
    </div>
    <div class="panel-body">
      <form id="addForm" method="post" action="admin_product_add">
        <div class="form-group">
          <label>产品名称</label>
          <input id="name" name="name" type="text" class="form-control">
        </div>
        <div class="form-group">
          <label>产品小标题</label>
          <input id="subTitle" name="subTitle" type="text" class="form-control">
        </div>
        <div class="form-group">
          <label>原价格</label>
          <input id="originalPrice" name="originalPrice" type="text" class="form-control">
        </div>
        <div class="form-group">
          <label>优惠价格</label>
          <input id="promotePrice" name="promotePrice" type="text" class="form-control">
        </div>
        <div class="form-group">
          <label>库存</label>
          <input id="stock" name="stock" type="text" class="form-control">
        </div>
        <input name="cid" type="hidden" value="${c.id}">
        <button type="submit" class="btn btn-default">提交</button>
      </form>
    </div>
  </div>

<%@include file="../include/admin/adminFooter.jsp"%>