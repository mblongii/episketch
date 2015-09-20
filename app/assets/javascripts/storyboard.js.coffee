$ ->

  if $('.storyboard.show #sketches').length > 0

    Sortable.create el = document.getElementById("sketches"),

      group: "sorted-sketches"
      animation: 300
      delay: 150
      draggable: '.sketch'
      handle: '.img-responsive'

      store: # save the sort settings

        get: (sortable) ->
          order = localStorage.getItem sortable.options.group
          return if order then order.split '|' else []

        set: (sortable) ->
          order = sortable.toArray();
          localStorage.setItem sortable.options.group, order.join('|')
