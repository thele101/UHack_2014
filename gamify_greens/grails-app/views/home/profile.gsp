<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="layout_template"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>Green Profile</title>
</head>
<body>
  <div class="body">
  	<div id="announcements">
	  	<p>You've harvested <div id="test">0</div> Target flowers!</p>
	  	<p>You are now in 1st place among people who shop at your local Target.com. 
	  	Eventually, this will be expanded into local Target locations.</p>
	  	<p>In addition, this page will eventually bring back information about the user's green history - purchases, etc. Be sure to come back to Target while your flowers are still blooming.</p>  	
  	</div>
  </div>
  <div id="bigTree">
			<g:img dir="grails-app/assets/images" file="tree.jpg" width="500" height="500"/>
  </div>
  <div id="infoForm">
	  <form id = infoForm>
	            <input type="hidden" id="flowerCount" value="0" />
	            <input type="text" value="######" id="getUserId"/>
	            <input type="submit" value="submit user id for personalized feedback" id="getUserId2"/>
	  </form>
  </div>
  <div id="flowerGarden">
			<g:img dir="grails-app/assets/images" file="flower_garden.jpg" width="300" height="300"/>
  </div>
  <script>

 /* var urlHuh = $(location).attr('href');
	$("input#getUserId2").click(function(){
		$('#flowerCount').val(15);
		$.ajax({
			type:"POST",
			url:urlHuh,
			success:function(result){
	     		$("#test").val(15);
	}})
		});*/
	$(document).ready(function(){
		$("input#getUserId2").click(function(){
		    $("#test").text("150");
		  })});
  </script>	
</body>
</html>