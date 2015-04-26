var url = '/nbaplayers.json';
d3.json( url, function( error, data ) {
    console.log(data);
    var m = [30, 10, 10, 30],
        w = 960 - m[1] - m[3],
        h = 930 - m[0] - m[2];
    var x = d3.scale.linear().range([0, w]),
        y = d3.scale.ordinal().rangeRoundBands([0, h], .1);
    var xAxis = d3.svg.axis().scale(x).orient("top").tickSize(-h),
        yAxis = d3.svg.axis().scale(y).orient("left").tickSize(0);

    var canvas = d3.select(".graph").append("svg")
        .attr('align', 'middle')
        .attr('class', 'chart')
        .attr("width", 500)
        .attr("height", 400);

    canvas.selectAll("rect")
        .data(data)
        .enter()
        .append("rect")
        .attr("width", function (d) { return (d.cost/d.avgpoints).toFixed(0); })
        .attr("height", 30)
        .attr("y", function (d,i) { return i*50; })

    canvas.selectAll("text")
        .data(data)
        .enter()
        .append("text")
        .attr("fill", "white")
        .attr("background", "black")
        .attr("x", function(d) { return (d.cost/d.avgpoints).toFixed(0); })
        .attr("y", function (d,i) { return i*50 +27; })
        .text(function (d) { return (d.cost/d.avgpoints).toFixed(0)});

    canvas.selectAll("names")
        .data(data)
        .enter()  
        .append("text")
        .attr("fill", "white")
        .attr("x", 5)
        .attr("y", function (d,i) { return i*50 + 27})
        .text(function (d) { return d.name; }); 

    canvas.selectAll("circle")
        .data(data)
        .enter()
        .append("circle")
        .attr("fill","black")
        .attr("x", function(d) { return (d.cost/d.avgpoints).toFixed(0); })
        .attr("y", function (d,i) { return i*50 +27; })
});

