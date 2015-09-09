# coding: utf-8
module EventsHelper

  def render_method_options(selected = nil)
    options = [
      ['Table',                 'table_timeline'        ],
      ['Table with categories', 'table_with_categories' ],
      ['Vis Timeline',          'vis_timeline'          ],
      ['Editor',                'editor'                ]
    ]
    options_for_select(options, selected)
    end
  
end
