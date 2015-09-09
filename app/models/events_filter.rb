# coding: utf-8
class EventsFilter

  include ActiveModel::Model

  attr_accessor :category_ids,
                :source_ids,
                :render_method,
                :group_by_country

  # Input
  
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

  def group_by_country=(value)
    @group_by_country = (value == "1" ? true : false)
  end

  # Output
  
  def partial
    if Event::RENDER_METHODS.include?(render_method)
      render_method
    else
      Event::RENDER_METHODS.first
    end
  end

  def data
    case @render_method
    when 'table_timeline'
      table_timeline_data
    when 'table_with_categories'
      table_with_categories_data
    when 'vis_timeline'
      vis_timeline_data
    when 'editor'
      events
    end
  end
  
  def events
    Event.filtered(self)
  end

  private

  def table_timeline_data
    {events_by_year: Event.by_year(events)}
  end

  def table_with_categories_data
    {events_by_year: Event.by_year(events)}
  end
  
  def vis_timeline_data
    VisTimeline.new(events, {
      fullscreen: false,
      group_by_country: @group_by_country
    }).data
  end

  
end
