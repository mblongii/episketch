$ ->
  if $('.swatch_test.index').length > 0
    console.log 'swatch test'

    # replace placholders with new content
    i = $('.sketch-img').data('sketch-id')
    for sketch in $('.sketch-img')
      $("[data-sketch-id=#{i}]").css('background-image', "url(/sample-sketches/sketch_#{i}.png)")
      i++

    # Coloring
    sampled_image = $('<img id="sample_this_image">')
    sampled_image.attr('src', $('.sketch-img').first().css('background-image').replace(/^url|["\(\)"]/g, ''))
    sampled_image.attr('style', 'position: absolute; top: -9000px; width: 500px;')
    sampled_image.appendTo('body')

    color_src = $('#sample_this_image')[0]
    colorThief = new ColorThief()

    $(color_src).load ->
      num_colors = 24
      the_color = colorThief.getColor(color_src)
      the_palette = colorThief.getPalette(color_src, num_colors)

      for rgb in the_palette
        color_swatch = $("<div class='swatch_#{i++}'>")
        color_swatch.attr("style", "background-color: rgb(#{rgb}); width: 20px; height: 20px; border: 1px solid gray; display: inline-block;")
        color_swatch.attr("title", "#{rgb}")
        color_swatch.prependTo('#swatch_test')

      sums = []
      for rgb in the_palette
        sum = rgb.reduce (x, y, z) -> x + y + z
        sums.push sum

      brightest = sums.indexOf(Math.max.apply(Math, sums))
      darkest = sums.indexOf(Math.min.apply(Math, sums))
      desc_color = the_palette[brightest]
      bg_color = the_palette[darkest]

      the_palette.splice(brightest, 2)
      sums.splice(brightest, 2)

      next_brightest = sums.indexOf(Math.max.apply(Math, sums))
      title_color = the_palette[next_brightest]

      $('body').css('background-color', "rgb(#{bg_color})")
      $('body').css('color', "rgb(#{title_color})")
      $('p.description').css('color', "rgba(#{desc_color}, 1.0)")

      i = 0
      $("<span> &nbsp; &nbsp;</span>").prependTo('#swatch_test')
      for rgb in the_palette
        color_swatch = $("<div class='swatch_#{i++}'>")
        color_swatch.attr("style", "background-color: rgb(#{rgb}); width: 20px; height: 20px; border: 1px solid gray; display: inline-block;")
        color_swatch.attr("title", "#{rgb}")
        color_swatch.prependTo('#swatch_test')
