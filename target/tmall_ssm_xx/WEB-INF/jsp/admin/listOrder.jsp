<%--
  Created by IntelliJ IDEA.
  User: xiongxi
  Date: 2018/1/18
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    $(function(){
        $("button.orderPageCheckOrderItems").click(function(){
            var oid = $(this).attr("oid");
            $("tr.orderPageOrderItemTR[oid="+oid+"]").toggle();
        });
    });

</script>

<div class="container">
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover1  table-condensed">
            <caption><span class="label label-info">订单管理</span></caption>
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>状态</th>
                <th>金额</th>
                <th>商品数量</th>
                <th>买家名称</th>
                <th>创建时间</th>
                <th>支付时间</th>
                <th>发货时间</th>
                <th>确认收货时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${os}" var="o">
            <tr>


                <td>${o.id}</td>
                <td>${o.statusDesc}</td>
                <td>￥<fmt:formatNumber type="number" value="${o.total}" minFractionDigits="2"/></td>
                <td>${o.totalNumber}</td>
                <td>${o.user.name}</td>

                <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${o.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                <td>
                    <button oid="${o.id}" class="orderPageCheckOrderItems btn btn-primary btn-xs">查看详情</button>
                    <c:if test="${o.status=='waitDelivery'}">
                        <a href="admin_order_delivery?id=${o.id}">
                            <button class="btn btn-primary btn-xs">发货</button>
                        </a>
                    </c:if>
                </td>
            </tr>
                <tr class="orderPageOrderItemTR" oid="${o.id}">
                    <td colspan="10" align="center">
                        <div  class="orderPageOrderItem">
                            <table width="800px" align="center" class="orderPageOrderItemTable">
                                <c:forEach items="${o.orderItems}" var="oi">
                                    <tr>
                                        <td align="left">
                                            <img width="40px" height="40px" src="img/productSingle/${oi.product.firstproductImage.id}.jpg">
                                        </td>

                                        <td>
                                            <a href="foreproduct?pid=${oi.product.id}">
                                                <span>${oi.product.name}</span>
                                            </a>
                                        </td>
                                        <td align="right">

                                            <span class="text-muted">${oi.number}个</span>
                                        </td>
                                        <td align="right">

                                            <span class="text-muted">单价：￥${oi.product.promotePrice}</span>
                                        </td>

                                    </tr>
                                </c:forEach>

                            </table>
                        </div>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

<%@include file="../include/admin/adminPage.jsp" %>

<%@include file="../include/admin/adminFooter.jsp"%>