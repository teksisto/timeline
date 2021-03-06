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
        title:   e.description,
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
        age_css_class = toggle_age_css_class(e.location)
        if age_css_class.present?
          hash.merge!(className: age_css_class)
        end
      end
      # TODO
      #
      # Сейчас, если у события не указан location, и выбрана
      # группировка по странам, событие выкидывается. Проблема в том,
      # что если vis отдавать события, не привязанные к группе, то он
      # падает, хотя в документации написано, что он их просто не
      # будет показывать. Возможно лучшей стратегией было бы все
      # события без location добавлять в отдельную группу с пустым
      # заголовком.
      if @options[:group_by_country] && !e.location
        nil
      else
        hash
      end
    end
    JSON.pretty_generate(items.compact)
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
                           min: '1400-01-01',
                           max: '2020-01-01'
                           # zoomMin: 10000*60*60*24*31,
                           # zoomMax: 10000*60*60*24*31*12*100
                         })
  end
  
  def fullscreen_options
    JSON.pretty_generate({
                           # width:  1915,
                           # minHeight: 1070,
                           width:  1915,
                           height: 1060,
                           min:   '1400-01-01',
                           max:   '2020-01-01'
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
  
  def toggle_age_css_class(location)
    @css_class_by_location ||= {}
    current_class = @css_class_by_location[location]
    next_class = current_class.present? ? '' : 'negative'
    @css_class_by_location[location] = next_class
    next_class
  end

end
