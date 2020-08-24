

<!DOCTYPE html>
<html>
<head>
  
 <script type="text/javascript" src="//code.jquery.com/jquery-1.9.1.js"></script>


</head>
<body>
<div class="hours">We are OPEN</div>
<script type="text/javascript">
$(document).ready(function () {
    var d = new Date();
    var dayOfWeek = d.getDay();
    var hour = d.getHours();
    
    // open hours Monday - Friday 9am - 5:pm = open
   if (dayOfWeek !== 6 && dayOfWeek !== 0 && hour >= 9 && hour < 17) {
    $('.morning').show();  
}
else {
  	$('.morning').hide(); 
}  });
</script>



 


</body>
</html>
