# coding: utf-8
module SourcesHelper

  def temp_org_render(str)
    Orgmode::Parser.new(str).to_html.html_safe
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

  def source_title
    content_tag('h3') do
      category_icon(@source) + by_line_links(@source) + @source.label
    end
  end

  def source_link
    if @source.link.present?
      content_tag('p') do
        content_tag('i', class: 'fa fa-link') do
          ' '.html_safe + link_to(@source.link, @source.link)
        end
      end
    end
  end
  
  
end
