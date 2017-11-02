<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<h1>My Web Page</h1>

<div id="piechart"></div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
 var PersonalDataVO = JSON.stringify({ 
			    	  'playerID':playerID, 'gameID':gameID, 'teamID':teamID, 'gameTime':gameTime, 'twoPoint':twoPoint,
			    	  'twoPointShot':twoPointShot, 'threePoint':threePoint, 'threePointShot':threePointShot, 'fg':fg, 'fgShot':fgShot,
			    	  'offReb':offReb, 'defReb':defReb, 'assist':assist, 'steal':steal, 'blocks':blocks,
			    	  'turnover':turnover, 'personalFouls':personalFouls, 'points':points, 'startingPlayer':startingPlayer 
			    	  })

function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['投籃(%)', 'Hours per Day'],
  ['三分(%)', 8],
  ['罰球(%)', 2],

]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'My Average Day', 'width':550, 'height':400};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>

</body>
</html>