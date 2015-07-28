module EventsHelper

  def render_method_options(selected = nil)
    options = [
      ['Timeline', 'timeline_table'],
      ['Timeline with categories', 'timeline_with_categories'],
      ['Editor',   'editor']
    ]
    options_for_select(options, selected)
  end

end
