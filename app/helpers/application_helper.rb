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

end
