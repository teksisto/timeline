module SourcesHelper

  def temp_org_render(str)
    Orgmode::Parser.new(str.gsub("\r", "\n")).to_html.html_safe
  end
  
end
