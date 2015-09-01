module EventsHelper

  def render_method_options(selected = nil)
    options = [
      ['Timeline', 'timeline_table'],
      ['Timeline with categories', 'timeline_with_categories'],
      ['Vis Timeline', 'vis_timeline'],
      ['Editor',   'editor']
    ]
    options_for_select(options, selected)
  end

  def data_for_vis_timeline(events, options = {})
    age_css_class = ''
    items = events.map do |e|
      hash = {
        id:      e.id,
        content: e.label,
        start:   e.start_date.strftime('%Y-%m-%d'),
        type:    (e.period ? 'range' : 'point')
      }
      if e.period
        hash.merge!(end: e.end_date.strftime('%Y-%m-%d'))
      end
      if e.location
        hash.merge!(group: e.location.id)
      end
      if e.age
        hash.merge!(type: 'background')
        age_css_class = toggle_age_css_class(age_css_class)
        if age_css_class.present?
          hash.merge!(className: age_css_class)
        end
      end
      hash
    end
    groups = events.map{|e| e.location}.compact.uniq.map{|l|
      {
        id: l.id,
        content: l.label
      }
    }
    inline_options = {
      type: 'point',
      # minHeight: 500,
      min: '1750-01-01',
      max: '2020-01-01'
      # zoomMin: 10000*60*60*24*31,
      # zoomMax: 10000*60*60*24*31*12*100
      }

    fullscreen_options = {
      # width:  1915,
      # minHeight: 1070,
      min: '1750-01-01',
      max: '2020-01-01'
      # zoomMin: 10000*60*60*24*31,
      # zoomMax: 10000*60*60*24*31*12*100
    }
    
    data = Hash.new
    data[:items]              = JSON.pretty_generate(items)
    data[:groups]             = JSON.pretty_generate(groups)

    if options[:fullscreen]
      data[:options] = JSON.pretty_generate(fullscreen_options)
    else
      data[:options] = JSON.pretty_generate(inline_options)
    end
    
    data
  end

  def toggle_age_css_class(str)
    if str.present?
      ''
    else
      'negative'
    end
  end
  
end
