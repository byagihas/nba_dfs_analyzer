var url = '/nbaplayers.json';
d3.json( url, function( error, data ) {
    console.log(data);

    var canvas = d3.select(".graph").append("svg")
      .attr('align', 'middle')
      .attr('class', 'chart')
      .attr("width", 500)
      .attr("height", 500);

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

    canvas.append("path")
        .attr("class", "line")
        .attr("width", 500);
});

