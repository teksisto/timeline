# coding: utf-8
module EventsHelper

  def render_method_options(selected = nil)
    options = [
      ['Timeline',                 'timeline_table'           ],
      ['Timeline with categories', 'timeline_with_categories' ],
      ['Vis Timeline',             'vis_timeline'             ],
      ['Editor',                   'editor'                   ]
    ]
    options_for_select(options, selected)
  end

  def vis_data(events, options = {})
    data = Hash.new
    data[:items]       = vis_items(events)
    data[:groups]      = vis_groups(events)
    data[:options]     = vis_options(options)
    data[:initializer] = vis_initializer
    data
  end

  def vis_items(events)
    age_css_class = ''
    items = events.map do |e|
      hash = {
        id:      e.id,
        content: e.label,
        start:   e.start_date.strftime('%Y-%m-%d'),
        type:    'point'
      }
      if e.period
        hash.merge!({
                      end: e.end_date.strftime('%Y-%m-%d'),
                      type: 'range'
                    })
      end
      if @events_filter.group_by_country && e.location
        hash.merge!(group: e.location.id)
      end
      if @events_filter.group_by_country && e.age
        # TODO
        #
        # Президенты показываются в виде background только когда
        # выбрана группировка по странам. Если группировка по странам
        # не выбрана, то они показываются как range. Выглядит не
        # очень, но выбирать события по категориям пока не хочется.
        hash.merge!(type: 'background')
        age_css_class = toggle_age_css_class(age_css_class)
        if age_css_class.present?
          hash.merge!(className: age_css_class)
        end
      end
      hash
    end
    JSON.pretty_generate(items)
  end
  
  def vis_groups_content(events)
    JSON.pretty_generate(
      events.map{|e| e.location}.compact.uniq.map{|l|
      {
        id: l.id,
        content: l.label
      }
    })
  end
  
  def vis_groups(events)
    if @events_filter.group_by_country
      "var groups = new vis.DataSet( #{vis_groups_content(events)} );"
    end
  end

  def vis_initializer
    if @events_filter.group_by_country
      "var timeline = new vis.Timeline(container, items, groups, options);"
    else
      "var timeline = new vis.Timeline(container, items, options);"
    end
  end

  def vis_inline_options
    JSON.pretty_generate({
      type: 'point',
      # minHeight: 500,
      min: '1750-01-01',
      max: '2020-01-01'
      # zoomMin: 10000*60*60*24*31,
      # zoomMax: 10000*60*60*24*31*12*100
    })
  end
  
  def vis_fullscreen_options
    JSON.pretty_generate({
      # width:  1915,
      # minHeight: 1070,
      min: '1750-01-01',
      max: '2020-01-01'
      # zoomMin: 10000*60*60*24*31,
      # zoomMax: 10000*60*60*24*31*12*100
    })
  end

  def vis_options(options)
    if options[:fullscreen]
      vis_fullscreen_options
    else
      vis_inline_options
    end
  end

  # TODO Надо чередовать классы внутри одной страны, а не глобально.
  def toggle_age_css_class(str)
    if str.present?
      ''
    else
      'negative'
    end
  end
  
end
