$ ->
  # Sorting
  if $('.storyboard.show #sketches').length > 0

    # ensure add new is always the last frame on the board
    addSketchEl = $('#sketches .add-sketch')
    make_add_sketch_last = ->
      $('#sketches').append( addSketchEl)

    sort_sketches = Sortable.create el = $("#sketches")[0],

      animation: 300
      delay: 150
      draggable: '.sketch'
      handle: '.handle'
      scroll: false

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
    $.event.special.scrollstop.latency = 200;
    $(window)
      .on "scrollstart", ->
        sort_sketches.option('disabled', true)
        console.log 'scroll start'
      .on "scrollstop", ->
        console.log 'scroll stop'
        sort_sketches.option('disabled', false)

    # replace placholders with new content
    i = 0
    for sketch in $('.sketch-img')
      $("[data-sketch-id=#{i}]").css('background-image', "url(/sample-sketches/sketch_#{i}.png)")
      i++

    make_add_sketch_last()

  # Coloring
  my_image = $('#the_image')[0]
  colorThief = new ColorThief()
  $(my_image).load ->
    the_color = colorThief.getColor(my_image)
    console.log the_color
    # $('body').css('color', "rgb(#{the_color})")
    the_palette = colorThief.getPalette(my_image, 2)
    console.log the_palette
    $('body').css('background-color', "rgb(#{the_palette[1]})")
    $('body').css('color', "rgb(#{the_palette[0]})")