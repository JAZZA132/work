$(document).ready(function () {
    var d = new Date();
    var dayOfWeek = d.getDay();
    var hour = d.getHours();
    
    // open hours Monday - Friday 9am - 5:pm = open
   if (dayOfWeek !== 6 && dayOfWeek !== 0 && hour >= 9 && hour < 17) {
    $('.hours').show();
    
}
else {
    $('.hours').hide();
   
}
  
    
});