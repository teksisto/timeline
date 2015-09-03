# coding: utf-8
module ApplicationHelper

  def category_icon(resource)
    if resource.kind_of?(Category)
      category = resource
    elsif resource.kind_of?(Source)
      category = resource.category
    elsif
      raise TypeError
    end
    if category.present?
      content_tag('span', category.color, style: "color: #{category.color}") do
        content_tag('i', '', class: "fa fa-#{category.icon}")
      end
    else
      ''
    end
  end

  def category_options_for_select(roots, selected = nil)

    if roots.respond_to?(:to_a) && roots.empty?
      roots = Category.roots
    elsif !roots.respond_to?(:to_a)
      roots = [roots]
    end

    grouped_options_for_select(
      roots.map{|r|
        [
          r.label,
          r.descendants.map{|d| [' » '*(d.depth-1 ) + d.label, d.id]}
        ]
      }, selected 
    ).html_safe

  end

  def ancestors_breadcrumbs(object)
    path = if object.ancestors.present?
             object.ancestors.map{|a| link_to(a.label, category_path(a))+ ' » ' }.join
           else
             ''
           end
    (path + object.label).html_safe
  end

end
