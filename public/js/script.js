$(function(){

	var dataset1 = [5,10,15,20,25];
	var dataset2 = [
					[5,10],
					[480,90],
					[250,50],
					[100,33],
					[330,95],
					[410,12],
					[475,44],
					[25,67],
					[85,21],
					[220,88]
					];
	var w = 500,
		h = 500;
	var newNumber = Math.random()*50;

	var svg = d3.select("#graph")
				.append("svg")
				.attr("width",w)
				.attr("height",h);
	svg.selectAll("circle")
		.data(dataset2)
		.enter()
		.append("circle")
		.attr("cx",function(d){
			return d[0];
		})
		.attr("cy",function(d){
			return d[1];
		})
		.attr("r",function(d){
			return Math.sqrt(h-d[1]);
		});
	svg.selectAll("text")
		.data(dataset2)
		.enter()
		.append("text")
		.text(function(d){
			return d[0] + ","+ d[1];
		})
		.attr("x",function(d){
			return d[0];
		})
		.attr("y",function(d){
			return d[1];
		})
		.attr("font-family","sans-serif")
		.attr("font-size","11px")
		.attr("fill","red");



	d3.json("test.json",function(json){
		// console.log(json);
		// dataset = json;
	});
});