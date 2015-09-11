# coding: utf-8
class VisTimeline

  def initialize(events, options = {})
    @events = events
    @options = options
  end

  def data
    data = Hash.new
    data[:items]       = items
    data[:groups]      = groups
    data[:options]     = initializer_options
    data[:initializer] = initializer
    data
  end
  
  def items
    age_css_class = ''
    items = @events.map do |e|
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
      if @options[:group_by_country] && e.location
        hash.merge!(group: e.country.id)
      end
      if @options[:group_by_country] && e.age
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
  
  def groups_content
    JSON.pretty_generate(
      @events.map{|e| e.country}.compact.uniq.map{|l|
        {
          id: l.id,
          content: l.label
        }
      })
  end
  
  def groups
    if @options[:group_by_country]
      "var groups = new vis.DataSet( #{groups_content} );"
    end
  end

  def initializer
    if @options[:group_by_country]
      "var timeline = new vis.Timeline(container, items, groups, options);"
    else
      "var timeline = new vis.Timeline(container, items, options);"
    end
  end

  def inline_options
    JSON.pretty_generate({
                           type: 'point',
                           # minHeight: 500,
                           min: '1750-01-01',
                           max: '2020-01-01'
                           # zoomMin: 10000*60*60*24*31,
                           # zoomMax: 10000*60*60*24*31*12*100
                         })
  end
  
  def fullscreen_options
    JSON.pretty_generate({
                           # width:  1915,
                           # minHeight: 1070,
                           min: '1750-01-01',
                           max: '2020-01-01'
                           # zoomMin: 10000*60*60*24*31,
                           # zoomMax: 10000*60*60*24*31*12*100
                         })
  end

  def initializer_options
    if @options[:fullscreen]
      fullscreen_options
    else
      inline_options
    end
  end

  private
  
  # TODO Надо чередовать классы внутри одной страны, а не глобально.
  def toggle_age_css_class(str)
    if str.present?
      ''
    else
      'negative'
    end
  end

end
