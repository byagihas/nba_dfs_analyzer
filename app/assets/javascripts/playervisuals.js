var ready;
ready = function(){
    var url = '/nbaplayers.json';
    d3.json( url, function( error, data ) {
        console.log(data);
        w = 300
        h = 1

        var x = d3.scale.linear().range([0, w]),
            y = d3.scale.ordinal().rangeRoundBands([0, 100], 100);
        var xAxis = d3.svg.axis().scale(x).orient("bottom").tickSize(3),
            yAxis = d3.svg.axis().scale(y).orient("left").tickSize(5);

        var canvas = d3.select(".graph").append("svg")
            .attr('align', 'middle')
            .attr('class', 'chart')
            .attr("width", 500)
            .attr("height", 400)

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

       var xAxisGroup = canvas.append("g")
            .call(yAxis)
            .call(xAxis);
    });
};
$(document).ready(ready);
$(document).on('page:load',ready);
