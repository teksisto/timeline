# coding: utf-8
module SourcesHelper

  def temp_org_render(str)
    Orgmode::Parser.new(str.gsub("\r", "\n")).to_html.html_safe
  end

  def by_line_links(source)
    if source.authors.present?
      (source.authors.map{|a| link_to a.screen_label, person_path(a)}.join(', ') + ' — ').html_safe
    else
      ''
    end
  end

  def by_line_text(source)
    if source.authors.present?
      (source.authors.map{|a| a.screen_label}.join(', ') + ' — ').html_safe
    else
      ''
    end
  end

end
