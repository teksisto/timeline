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
    events.map{|e|
      {id: e.id, content: e.name, start: e.date.strftime('%Y-%m-%d')}
    }.to_json
  end
  
end
