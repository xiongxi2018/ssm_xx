<%--
  Created by IntelliJ IDEA.
  User: xiongxi
  Date: 2018/1/15
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<%--<script>
    $(function () {
        $("#pvValue").keyup(function(){
            var value = $(this).val();
            var page = "admin_propertyValue_update";
            var pvid = $(this).attr("pvid");
            var parentSpan = $(this).parent("span");
            parentSpan.css("border","1px solid yellow");
            $.post(
                page,
                {"value":value,"id":pvid},
                function (result) {
                    if ("success"==result)
                        parentSpan.css("border","1px solid green");
                    else
                        parentSpan.css("border","1px solid red")
                }
            );
        });
    });

</script>--%>
<style>
    .input-group{
        margin: 10px;
    }
</style>
<script>
    $(function() {
        $("input.pValue").keyup(function(){
            var value = $(this).val();
            var page = "admin_propertyValue_update";
            var pvid = $(this).attr("pvid");
            console.log("prev1:"+$(this).prev())
            console.log("prev2:"+$("input.pValue").prev())
            /*$(this).prev().addClass("label label-success");*/
            var pInput = $(this);
            $.post(
                page,
                {"value":value,"id":pvid},
                function(result){
                    if("success"==result)
                        $(pInput).prev().addClass("label label-success");
                    else
                        $(pInput).prev().addClass("label label-error");
                }
            );
        });
    });
</script>
<ol class="breadcrumb">
    <li><a href="admin_category_list">所有分类</a></li>
    <li><a href="admin_product_list?cid=${p.category.id}">${p.category.name}</a></li>
    <li class="active">${p.name}</li>
    <li class="active">编辑属性</li>
</ol>

<div class="container-fluid">
    <div class="col-sm-6 col-sm-offset-3">
        <c:forEach items="${pvs}" var="pv" varStatus="status">
            <div class="col-md-6">
                <div class="input-group">
                    <span class="label label-primary pName">${pv.property.name}</span>
                    <input type="text" class="form-control pValue" status="${status.count}" pvid="${pv.id}" value="${pv.value}">
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%--<script>
    $(function() {
        $("input.pvValue").keyup(function(){
            var value = $(this).val();
            var page = "admin_propertyValue_update";
            var pvid = $(this).attr("pvid");
            var parentSpan = $(this).parent("span");
            parentSpan.css("border","1px solid yellow");
            $.post(
                page,
                {"value":value,"id":pvid},
                function(result){
                    if("success"==result)
                        parentSpan.css("border","1px solid green");
                    else
                        parentSpan.css("border","1px solid red");
                }
            );
        });
    });
</script>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a></li>
        <li><a href="admin_product_list?cid=${p.category.id}">${p.category.name}</a></li>
        <li class="active">${p.name}</li>
        <li class="active">编辑产品属性</li>
    </ol>

    <div class="editPVDiv">
        <c:forEach items="${pvs}" var="pv">
            <div class="eachPV">
                <span class="pvName" >${pv.property.name}</span>
                <span class="pvValue"><input class="pvValue" pvid="${pv.id}" type="text" value="${pv.value}"></span>
            </div>
        </c:forEach>
        <div style="clear:both"></div>
    </div>

</div>
<%@include file="../include/admin/adminFooter.jsp"%>--%>
