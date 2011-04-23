module RedisSnippets
  module SnippetsHelper
    def snippet(advert, classes=nil)
      return '' if controller.status == 404
      ad_html = RedisSnippets::Snippets.send(advert)
      return '' if ad_html.blank?
      content_tag(:div, ad_html.html_safe, :class => ['advert', classes || advert.to_s].compact.join(' ').html_safe)
    end
  end
end
