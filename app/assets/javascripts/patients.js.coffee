# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.dev-rick-graph').each (index, value) ->
    series = $(value).data("series")
    if series?
      temp_graph = new Rickshaw.Graph 
        element: document.querySelector("#"+$(value).attr('id')),
        width: 580,
        height: 250,
        renderer: 'line',
        series: series
      x_axis = new Rickshaw.Graph.Axis.Time( { graph: temp_graph } )
      y_selector = "#"+$(value).siblings('.y_axis').attr('id')
      y_axis = new Rickshaw.Graph.Axis.Y
        graph: temp_graph,
        orientation: 'left',
        tickFormat: Rickshaw.Fixtures.Number.formatKMBT,
        element: document.querySelector(y_selector)

      temp_graph.render()