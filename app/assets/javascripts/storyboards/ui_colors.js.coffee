$ ->
  # Coloring
  if $('.storyboard.show #sketches').length > 0
    sampled_image = $('<img id="sample_this_image">')
    sampled_image.attr('src', $('.sketch-img').first().css('background-image').replace(/^url|[\(\)]/g, ''))
    sampled_image.attr('style', 'position: absolute; top: -9000px;')
    sampled_image.appendTo('#sketches')
    color_src = $('#sample_this_image')[0]
    colorThief = new ColorThief()
    $(color_src).load ->
      the_color = colorThief.getColor(color_src)
      the_palette = colorThief.getPalette(color_src, 2)
      console.log the_palette
      $('body').css('background-color', "rgb(#{the_palette[1]})")
      $('body').css('color', "rgb(#{the_palette[0]})")
      $('.add-sketch .icon').css('color', "rgb(#{the_palette[1]})")
      $('.sketch-img').last().css('background-color', "rgb(#{the_palette[2]})")
