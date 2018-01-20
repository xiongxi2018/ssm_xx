<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%--
<div class="navitagorDiv">
	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
		<img style="margin-left:10px;margin-right:0px" class="pull-left" src="img/site/tmallbuy.png" height="45px">
		<a class="navbar-brand" href="#nowhere">天猫后台</a>
		
		<a class="navbar-brand" href="admin_category_list">分类管理</a>
		<a class="navbar-brand" href="admin_user_list">用户管理</a>
		<a class="navbar-brand" href="admin_order_list">订单管理</a>
	</nav>
</div>--%>
<nav class="nav navbar-default navbar-inverse" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-swich">
				<span class="sr-only">切换导航</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">天猫后台</a>
		</div>

		<div class="collapse navbar-collapse" id="nav-swich">
			<ul class="nav navbar-nav">
				<li><a href="admin_category_list">分类管理</a></li>
				<li><a href="admin_user_list">用户管理</a></li>
				<li><a href="admin_order_list">订单管理</a></li>
			</ul>
		</div>
	</div>
</nav>
