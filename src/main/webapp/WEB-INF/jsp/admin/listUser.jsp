<%--
  Created by IntelliJ IDEA.
  User: xiongxi
  Date: 2018/1/18
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<div class="container">
    <div class="table-responsive">
        <table class="table table-bordered">
            <caption><span class="label label-primary">用户管理</span></caption>
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>用户名称</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="u">
            <tr>
                <td>${u.id}</td>
                <td>${u.name}</td>
                </c:forEach>
            </tr>
            </tbody>
        </table>
    </div>

    <%@include file="../include/admin/adminPage.jsp" %>
    
    <%@include file="../include/admin/adminFooter.jsp"%>
