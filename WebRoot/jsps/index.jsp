<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎访问斗图帮</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" >
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/yl.css" />
	</head>

	<body style="background:#eee;">
	<jsp:include page="head2.jsp"></jsp:include>
		<div class="container" style="margin-top: 60px;">
		<!-- div class="row" >
				<h2 style="text-align: left;margin-top: 20px;padding-left: 10px;background: #13aadc;height:50px;color: #f5f5f5;line-height: 50px;border-radius: 10px; "><span class="glyphicon glyphicon-star" aria-hidden="true"></span><strong>最新系列图</strong><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span></h2>
			</div> -->
			<c:forEach items="${ttlist}" var="ttb">
				<div class="row" style="margin-top: 5px;background:#fff;border:1px solid #ddd;border-radius:20px;box-shadow: -1px -1px 1px #aaa inset;padding:4px;">
					<h3 style="padding-left: 10px"><span class="glyphicon glyphicon-link" ></span> <a href="${pageContext.request.contextPath }/jumptt.action?ttId=${ttb[0].tid }"  target="_blank" class="tttitle">${ttb[0].title }</a></h3>
					<hr/>
					<c:forEach items="${ttb}" var="imgs" >
						<a class="col-xs-3 cntA" style="margin-bottom: 10px">
							<span><img class="img-responsive" style="position: absolute;width: 100%;" src="imgs/loading.gif" data-original="${imgs.src }" alt="${imgs.alt }"></span>
							<div class="cntBack"></div>
		                    <div class="cntText1"><span class="glyphicon glyphicon-copy text-center copyicon" style="font-size: 40px;"></span></div>
		                    <div class="cntText2"><span class="text-center copytext">点击复制</span></div>
						</a>
					</c:forEach>
				</div>
			</c:forEach>
			<div class="row" style="margin-top: 10px;">
				<h4 class="text-center" style="color:#444;line-height: 30px;margin-bottom: 10px;background-color: #eee"><a class="moreA" href="${pageContext.request.contextPath }/ttimgs.action"><span class="glyphicon glyphicon-chevron-down"></span> 查看更多...</a></h4>
			</div>
			<!--  div class="row" style="margin-top: 10px;background:##6f5499;height: 50px;">
				<h2 style="text-align: left;margin-top: 20px;padding-left: 10px;background: #13aadc;height:50px;color: #f5f5f5;line-height: 50px;border-radius: 10px; "><span class="glyphicon glyphicon-star" aria-hidden="true"></span><strong>最新热门图片</strong><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span></h2>
			</div>-->
			<div class="row" style="margin-top: 30px;background:#fff;border-radius:4px;">
				<c:forEach items="${imglist }" var="imgb">
					<div class="col-xs-3 cntA">
						<span style="heigth:100%;width:100%;text-align: center;"><img class="img-responsive" style="position: absolute;height: auto;max-height:98%;width:90%" src="imgs/loading.gif" data-original="${imgb.src }" alt="${imgb.alt }"></span>
						<div class="cntBack"></div>
	                    <div class="cntText1"><span class="glyphicon glyphicon-copy text-center copyicon" style="font-size: 40px;"></span></div>
	                    <div class="cntText2"><span class="text-center copytext">点击复制</span></div>
					</div>
				</c:forEach>
			</div>
			<div class="row" style="margin-top: 10px;">
				<h4 class="text-center" style="color:#444;line-height: 30px;margin-bottom: 10px;background-color: #eee"><a class="moreA" href="${pageContext.request.contextPath }/imgs.action"><span class="glyphicon glyphicon-chevron-down"></span> 查看更多...</a></h4>
			</div>
		</div>
		
	<jsp:include page="bottom.jsp"></jsp:include>
	<jsp:include page="totop.jsp"></jsp:include>
		<script type="text/javascript" charset="utf-8">
		function search(){
			var keyword=$("#keyword").val();
			window.open("imgsbykey.action?page=1&key="+keyword); 
		}
		  $(function() {
		  	$("img").lazyload({effect: "fadeIn"});
		    var wid=document.documentElement.clientWidth;
			if(wid<991){
				$(".cntBack").remove();
				$(".cntText1").remove();
				$(".cntText2").remove();
				console.log("移除");
			}
			new Clipboard('.cntA', {
			    target: function(trigger) {
					   var childArr=trigger.children;
					    for(var i=0,len=childArr.length;i<len;i++){
					        if(childArr[i].nodeName=='SPAN'){
					            return childArr[i];
					        }
					    }
			    }
			});
		  });
		</script>
		<script>
			var one=true;
			window.onresize = function(){
				var wid=document.documentElement.clientWidth;
				if(wid<991 && one){
					$(".cntBack").remove();
					$(".cntText1").remove();
					$(".cntText2").remove();
					console.log("移除");
					one=false;
				}
				if(wid>991 && !one){
					var htm='<div class="cntBack"></div><div class="cntText1"><span class="glyphicon glyphicon-copy text-center copyicon" style="font-size: 40px;"></span></div><div class="cntText2"><span class="text-center copytext">点击复制</span></div>';
					$(".cntA").append(htm);one=true;
					console.log("加入");
				}
			}
		</script>
	</body>

</html>
