module TalksHelper

    def movie(url)
    url["watch?v="] = "embed/"
    url[/&.*/] = ""
    iframe = content_tag(
        :iframe,
        '', # empty body
        width: 560,
        height: 315,
        src: "#{url}",
        frameborder: 0,
        allowfullscreen: true
    )
    content_tag(:div, iframe, class: 'youtube-container')
    end
  
end
