# coding: utf-8
require 'pp'

class OrgToc

  attr_accessor :children
  attr_accessor :content
  attr_accessor :title
  attr_accessor :text
  attr_accessor :parent
  attr_accessor :level
  attr_accessor :content_size
  attr_accessor :quotes
  attr_accessor :buffer
  attr_accessor :previous_heading
  attr_accessor :line
  
  def self.import_to_db_from_file(filepath, root)

  end
  
  def initialize(options)
    @children = options[:children] || []
    @content = options[:content] || []
    @title = options[:title] || ''
    @text = ''
    @parent = options[:parent] || nil
    @level = options[:level] || 0
    @content_size = @content.size

    @buffer = []
    @previous_heading = nil
    @quotes = []
  end

  def parse
    while @line = @content.shift
      log '-'*10
      log "Current line is = #{@line}"
      if heading?
        set_level
        if level_is_the_same?
          unless previous_heading
            # нашли самого первого ребенка текущего узла
            # в буфере лежит текст, принадлежащий непосредственно заголовку
            add_text
          else
            # нашли со второго по предпоследнего ребенка текущего узла
            # в буфере лежит текст предыдущего ребенка текущего узла 
            add_child
          end
        else
          log "put to buffer - level is unmatching"
          @buffer << @line
        end
      else
        log "put to buffer - just text"
        @buffer << @line
      end
      if last_line?
        if previous_heading 
          # достигнут конец последовательности заголовков одного уровня
          # в буфере лежит текст последнего ребенка текущего узла
          add_child
        else
          # у текущего узла нет потомков, это лист
          # в буфере лежит текст, пренадлежащий непосредственно заголовку
          add_text
        end
      end
    end

    # доставать параграфы и цитаты удобнее всего из листов
    # здесь же можно доставать теги и аттрибуты
    children.each{|c| c.parse}
  end
  
  def sanitaze_heading(string)
    string = strip_stars(string)
    string = htmlize_heading(string)
  end

  def strip_stars(heading)
    heading.gsub(/^\*+\s+/, '')
  end

  def htmlize_heading(heading)
    heading.gsub('--', '&mdash;')
  end
  
  def render_to_text(str = '')
    unless @level == 0
      heading = '*'*@level + ' ' + @title + "\n"
      heading_content = heading + text
    else
      heading_content = ''
    end
    str + heading_content + @children.map{|c| c.render}.join
  end

  def render_to_db(parent)

    unless level == 0
      toc = Toc.create(name: title, parent: parent)
      if text.present?
        toc.create_outline(content: text)
      end
    end

    @children.each{|c| c.render_to_db(toc || parent)}
  end
  
  private
  
  def heading?
    @line =~ /^\*/
  end

  def level_is_the_same?
    @level+1 == @line_level
  end

  def add_child
    log 'spawn new instance - level is matching, also got previous title'
    log "title = #{@previous_heading}"
    log "buffer = #{@buffer.join}"
    @children << new_toc
    @previous_heading = @line
    @buffer = []
  end

  def add_text
    log "it's new previous title - level is matching, but there's no previous title"
    log "content of buffer flushed to @text = it's my text!"
    @text += @buffer.join # плюс равно на случай, если цитата находится в середине текста
    @buffer.clear
    @previous_heading = @line
  end
  
  def new_toc
    new_toc_hash = {
      parent: self,
      level: level+1,
      content: @buffer,
      title: sanitaze_heading(@previous_heading)
    }
    new_toc = OrgToc.new(new_toc_hash)
  end

  def last_line?
    @content.first.nil?
  end

  def log(str)
    puts "\t"*@level+str
  end

  def set_level
    @line_level = @line.count('*')
  end
  
end

if __FILE__==$0

  t = OrgToc.new(content: IO.readlines('simple.org'), title: 'ROOT')
  t.parse
  pp t
                 
end
