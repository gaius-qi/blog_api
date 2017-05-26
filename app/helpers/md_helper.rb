module MdHelper

  class CodeRayify < Redcarpet::Render::HTML
    # 要在 Redcarpet 解析代码块时高亮代码，重写它的代码块解析方法: block_code。
    def block_code(code, language)
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
  end

  def markdown(text)
    options = {
        :autolink => true,
        :space_after_headers => true,
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :hard_wrap => true,
        :strikethrough =>true
      }
    markdown = Redcarpet::Markdown.new(CodeRayify,options)
    markdown.render(text).html_safe
  end

end
