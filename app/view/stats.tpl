<!--Form that allows you to create a new question-->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VT Knowledge</title>

    <!-- Bootstrap -->
    <link href="<?php echo SERVER_PATH ?>public/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo SERVER_PATH ?>public/css/custom.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
  </head>
  <style>
body {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  position: relative;
  width: 960px;
}


path {
stroke: steelblue;
stroke-width: 2;
fill: none;
}
.axis path,
.axis line {
fill: none;
stroke: grey;
stroke-width: 1;
shape-rendering: crispEdges;
}

.axis text {
  font: 10px sans-serif;
}

/*.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}*/

.bar {
  fill: steelblue;
  fill-opacity: .9;
}


label {
  position: absolute;
  top: 10px;
  right: 10px;
}
</style>
  <body>

  <div class="container">
	<div class="row">
		<div class="col-sm-12">
			<h1 class="text-center">User Statistics</h1>
		 	
		</div>	
	</div>	

</div> 

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?php echo SERVER_PATH ?>public/js/bootstrap.min.js"></script>
    <script src="<?php echo SERVER_PATH ?>public/js/script.js"></script>
    <script src="http://d3js.org/d3.v3.min.js"></script>
	
<div class="chart">
	<div id="sidebar" style="display: none;">
                <div class="item-group">
                    <label class="item-label">Filter</label>
                    <div id="filterContainer" class="filterContainer checkbox-interaction-group"></div>
                </div>
    	</div>
	</div>
		
 	<div id="option">
	<select type='select' onchange='updateData(value);' style='color:steelblue;font-size:1.1em;'>
   		<option value='posted_q' name='posted_q' selected='true' >Posted Questions</option>
   		<option value='posted_a' name='posted_a'>Posted Answers</option>
   		<option value='received_q' name='received_q'>Received Questions</option>
   		<option value='received_a' name='received_a'>Received Answers</option>
	</select>
</div> 
<script>

var margin = {top: 20, right: 20, bottom: 30, left: 40},
    width = 560 - margin.left - margin.right,
    height = 300 - margin.top - margin.bottom;

var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], 1, 1);

var y = d3.scale.linear()
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

var svg = d3.select("body").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

//create line of values
var valueline = d3.svg.line()
  .x(function(d) { return x(d.day); })
  .y(function(d) { return y(d.variable); });


var json 

d3.json("<?php echo SERVER_PATH ?>app/controller/stats.json", function(error, result){
  json = result;
  var data = [];
        json.forEach(function(d){
            data.push({variable: +d['posted_q'], day: d['day']});
         });
  x.domain(data.map(function(d) { return d.day; }));
  y.domain([d3.min(data, function(d) { return d.variable; }), d3.max(data, function(d) { return d.variable; })]);

console.log(data);
  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
    .append("text")
      .attr("y", 26)
      .attr("dx", "50.71em")
      .style("text-anchor", "end")
      .text("Days");
  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("value");
  svg.append("path") // Add the valueline path.
      .attr("d", valueline(data))
      .attr("class", "line");
    });


//update data from combobox onChange
function updateData(value) {
        var data = [];
        json.forEach(function(d){
            data.push({variable: +d[value], day: d['day']});
         });
  x.domain(data.map(function(d) { return d.day; }));
  y.domain([d3.min(data, function(d) { return d.variable; }), d3.max(data, function(d) { return d.variable; })]);

    // Select the section we want to apply our changes to
    var trans = d3.select("body").transition();
    
    // Make the changes
    var transition = svg.transition().duration(750),
        delay = function(d, i) { return i * 50; };
    
    transition.select(".line") // change the value line
      .attr("d", valueline(data));
    
    transition.select(".y.axis") // change the y axis
      .call(yAxis);
    };
    
</script>
  </body>
</html>