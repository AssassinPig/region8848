require "redcarpet"
module ApplicationHelper
  def markdown(text, options = {})
    options = {   
      :autolink => true, 
      :space_after_headers => true,
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :hard_wrap => true,
      :strikethrough =>true,
      :filter_html => true
    }
    markdown = Redcarpet::Markdown.new(HTMLwithCodeRay,options)
    markdown.render(text).html_safe
  end

  class HTMLwithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
  end

  def fetch_all_category
    @categories = Category.all
  end
end
