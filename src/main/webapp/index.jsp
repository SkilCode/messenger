<%@page import="com.abhi.model.Message"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="./css/bootstrap.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Chat | group messaging</title>
</head>
<body>
	<script type="text/javascript">
	var flag = 0;
	flag = localStorage.getItem("value");
	</script>
	
	<style>
		.scroll {
		  background-color: transparent;
		  width: 100%;
		  height: 32em;
		  overflow: auto;
		}
		body{
		  padding-top:20px;
		  background-image: url('./images/background.jpg');
		  background-size: cover;
		  color:#fff;
		}	
		.textfeild {
		  width: 95%;
		  border:unset !important; padding-left: 1%;
		  background-color: transparent; color:#fff;
		  
		}
		.textfeild:focus{ border:unset !important; box-shadow: unset !important; outline:unset !important; }
		.textfeild::-webkit-input-placeholder{color:#fff; }

		@media (min-width:320px) and (max-width:767px) {
			.textfeild { width:86% !important; }
			  .scroll { height:44.5em !important;  width: 100%; overflow: auto;}
		}
		
				
	</style>
		
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="border rounded">
					<div class="border rounded" style="padding-left:20px; background-color:rgba(168, 168, 168, 0.19);">
						<h1 style="margin=10px;">Messenger</h1>
					</div>		
					<div class="scroll" id="msgBox">
					
					<%
				
					List<String> msg = (List<String>) request.getAttribute("messages");
					for(String m : msg){
						out.println("<p style='padding: 1px 10px 1px 10px; margin:10px; background-color: rgba(168, 168, 168, 0.19);' class='rounded' >" + m + "</p>"); 
					
					}
						 %>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="border rounded">
					<form action="save" autocomplete="off"> 
						<input type="text" class="textfeild " name="message" id="msg" placeholder="Message" required>
						<input class= "btn btn-light btn-sm" type="submit" value="Send">
					</form>
				</div>
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-7 offset-md-5 pt-4">
								
				<form action="delete">
				<button class="btn btn-light btn-sm" >Delete All</button>
				<a href="/" class="btn btn-light btn-sm" >Refresh</a>
				</form>
	
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	if(flag==1){
		var text=localStorage.getItem("text"); // retrieve
		document.getElementById('msg').value = text; // display
		localStorage.setItem("value", 0);
		}
	
	setInterval(function(){        
		var text_to_save=document.getElementById('msg').value;
		localStorage.setItem("text", text_to_save); // save the item
		localStorage.setItem("value", 1);
		location.reload();
				}, 60000);


		var input = document.getElementById("msg");
		
		input.focus();
		input.select();
	</script>

</html>
