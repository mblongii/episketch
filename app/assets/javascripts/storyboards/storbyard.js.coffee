$ ->
  # Sorting
  if $('.storyboard.show #sketches').length > 0

    sort_sketches = Sortable.create el = $("#sketches")[0],

      animation: 300
      delay: 150
      draggable: '.sketch'
      handle: '.handle'
      scroll: true
      store: # save the sort settings
        get: (sortable) ->
          order = localStorage.getItem sortable.options.group
          return if order then order.split ',' else []
        set: (sortable) ->
          order = sortable.toArray();
          localStorage.setItem sortable.options.group, order.join(',')

    $(window)
      .on "scrollstart", ->
        sort_sketches.option('disabled', true)
      .on "scrollstop", ->
        sort_sketches.option('disabled', false)

    # replace placholders with new content
    i = 0
    for sketch in $('.sketch-img')
      $("[data-sketch-id=#{i}]").css('background-image', "url(/sample-sketches/sketch_#{i}.png)")
      i++
