# coding: utf-8
class EventsFilter

  include ActiveModel::Model

  attr_accessor :category_ids,
                :source_ids,
                :render_method
  
  def category_ids=(array)
    @category_ids = array.delete_if(&:blank?)
  end
  
  def source_ids=(array)
    @source_ids = array.delete_if(&:blank?)
  end
    
  def render_method=(array)
    # Поле render_method сделано multiply=true только потому что
    # браузер его красиво рисует. Приводит это к тому, что можно
    # одновременно выбрать несколько методов, поэтому и нужна
    # следующая строчка.
    @render_method = array.delete_if(&:blank?).first
  end
  
  def partial
    if Event::RENDER_METHODS.include?(render_method)
      render_method
    else
      Event::RENDER_METHODS.first
    end
  end

  def events
    Event.filtered(self)
  end
  
end
