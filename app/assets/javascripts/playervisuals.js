var ready;
ready = function(){
    var url = '/nbaplayers.json';
    d3.json( url, function( error, data ) {
        var width = 350;
        var height = 400;

        var x = d3.scale.linear().range([0, 300]);
        x.domain(d3.extent(data, function(d) { return (d.cost/d.avgpoints); }));

        var xAxis = d3.svg.axis().scale(x).orient("bottom").ticks(5).tickSize(2).tickFormat(d3.format("d"));

        var canvas = d3.select(".graph").append("svg")
            .attr('align', 'middle')
            .attr('class', 'chart')
            .attr("width", width)
            .attr("height", height)

        canvas.selectAll("rect")
            .data(data)
            .enter()
            .append("rect")
            .attr("width", function (d) { return ((d.cost/d.avgpoints).toFixed(0)); })
            .attr("height", 25)
            .attr("y", function (d,i) { return i*50; })

        canvas.selectAll("text")
            .data(data)
            .enter()
            .append("text")
            .attr("fill", "white")
            .attr("background", "black")
            .attr("x", function(d) { return (d.cost/d.avgpoints).toFixed(0); })
            .attr("y", function (d,i) { return i*50 +20; })
            .text(function (d) { return (d.cost/d.avgpoints).toFixed(0)});

        canvas.selectAll("names")
            .data(data)
            .enter()  
            .append("text")
            .attr("fill", "white")
            .attr("x", 5)
            .attr("y", function (d,i) { return i*50 + 20})
            .text(function (d) { return d.name; });

       var xAxisG = d3.select("svg").append("g")
            .attr("transform","translate(0,300)")
            .call(xAxis);
    });
};
$(document).ready(ready);
$(document).on('page:load',ready);
