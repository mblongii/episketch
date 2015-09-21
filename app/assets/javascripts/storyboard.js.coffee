$ ->

  if $('.storyboard.show #sketches').length > 0

    # ensure add new is always the last frame on the board
    addSketchEl = $('#sketches .add-sketch')
    make_add_sketch_last = ->
      $('#sketches').append( addSketchEl)

    sort_sketches = Sortable.create el = $("#sketches")[0],

      animation: 300
      delay: 100
      draggable: '.sketch'
      handle: '.handle'

      store: # save the sort settings

        get: (sortable) ->
          order = localStorage.getItem sortable.options.group
          return if order then order.split ',' else []

        set: (sortable) ->
          order = sortable.toArray();
          localStorage.setItem sortable.options.group, order.join(',')

      onSort: (evt) ->
        make_add_sketch_last()

    # ensure a sketch cannot be 'chosen' unless scrolling has stopped (mainly for touch devices)
    $('#sketches')
      .on "scrollstart", ->
        sort_sketches.option('disabled', true)

      .on "scrollstop", ->
        sort_sketches.option('disabled', false)

    # replace placholders with new content
    i = 0
    for sketch in $('.sketch-img')
      $("[data-sketch-id=#{i}]").css('background-image', "url(/sample-sketches/sketch_#{i}.png)")
      i++

    make_add_sketch_last()