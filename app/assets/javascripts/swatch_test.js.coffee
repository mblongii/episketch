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
    sampled_image.attr('style', 'position: absolute; top: -9000px; width: 500px; height: 500px;')
    sampled_image.appendTo('body')
    color_src = $('#sample_this_image')[0]
    colorThief = new ColorThief()
    $(color_src).load ->
      num_colors = 8
      the_color = colorThief.getColor(color_src)
      the_palette = colorThief.getPalette(color_src, num_colors)
      console.log the_palette
      $('body').css('background-color', "rgb(#{the_palette[0]})")
      $('body').css('color', "rgb(#{the_palette[1]})")
      $('.add-sketch .icon').css('color', "rgb(#{the_palette[2]})")
      $('.sketch-img').last().css('background-color', "rgba(#{the_palette[1]}, 0.5)")
      i = 0
      for rgb in the_palette
        color_swatch = $("<div class='swatch_#{i++}'>")
        color_swatch.attr("style", "background-color: rgb(#{rgb}); width: 20px; height: 20px; border: 1px solid white; display: inline-block;")
        color_swatch.attr("title", "#{rgb}")
        color_swatch.prependTo('#swatch_test')
