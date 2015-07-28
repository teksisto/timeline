module EventsHelper

  def render_method_options(selected = nil)
    options = [
      ['Default', 'default_table'],
      ['Timeline', 'timeline_table']
    ]
    options_for_select(options, selected)
  end

end
