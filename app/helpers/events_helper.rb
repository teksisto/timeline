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

  def data_for_vis_timeline(events)
    age_css_class = ''
    data = events.map{|e|
      hash = {
        id:      e.id,
        content: e.label,
        start:   e.start_date.strftime('%Y-%m-%d'),
        end:     e.end_date.strftime('%Y-%m-%d')
      }
      if e.age
        hash.merge!(type: 'background')
        age_css_class = toggle_age_css_class(age_css_class)
        if age_css_class.present?
          hash.merge!(className: age_css_class)
        end
      end
      hash
    }
    JSON.pretty_generate(data)
  end

  def toggle_age_css_class(str)
    if str.present?
      ''
    else
      'negative'
    end
  end
  
end
