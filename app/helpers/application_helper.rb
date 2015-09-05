# coding: utf-8
module ApplicationHelper

  def button_destroy(object)
    link_to_destroy(object, 'btn btn-default')
  end

  def button_destroy_small(object)
    link_to_destroy(object, 'btn btn-default btn-xs')
  end
  
  def link_to_destroy(object, css_class = '')
    link_to t('.destroy', :default => t("helpers.links.destroy")),
            object,
            method: 'delete',
            data: { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) },
            class: css_class
  end

  def button_edit(object)
    link_to_edit(object, 'btn btn-default')
  end
  
  def button_edit_small(object)
    link_to_edit(object, 'btn btn-default btn-xs')
  end
    
  def link_to_edit(object, css_class = '')
    link_to t('.edit', :default => t("helpers.links.edit")),
            polymorphic_url(object, :routing_type => :path, :action => :edit),
            class: css_class
  end
  
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
        content_tag('i', '', class: "fa fa-#{category.icon}") + ' '
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
