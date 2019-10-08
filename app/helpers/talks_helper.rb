module TalksHelper

    def youtube_link?(url)

        url.include?("youtube.com") || url.include?("youtu.be")

    end

    def parse_url_for_embed(url)

        if url.include?("watch?v=")
            url["watch?v="] = "embed/"
        elsif url.include?("youtu.be/")
            url["youtu.be/"] = "youtube.com/embed/"
        end

        if url.include?("&")
            url[/&.*/] = ""
        end

    end

    def make_youtube_tag(url)

        parse_url_for_embed(url)

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
