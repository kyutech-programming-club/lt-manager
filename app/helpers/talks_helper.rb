module TalksHelper

    def movie(url)

        if url.include?("youtube.com/watch?v=")
            url["watch?v="] = "embed/"
        elsif url.include?("youtu.be/")
            url["youtu.be/"] = "youtube.com/embed/"
        else
            return "not youtube"
        end

        if url.include?("&")
            url[/&.*/] = ""
        end

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
