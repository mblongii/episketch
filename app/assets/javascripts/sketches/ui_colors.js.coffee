$ ->
  # Coloring
  if $('.sketch.show').length > 0
    console.log 'colors'
    sampled_image = $('<img id="sample_this_image">')
    sampled_image.attr('src', $('.img-responsive').first().attr('src'))
    sampled_image.attr('style', 'position: absolute; top: -9000px;')
    sampled_image.appendTo('body')
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
