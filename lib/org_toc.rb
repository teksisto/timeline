require 'pp'

class OrgToc

  attr_accessor :children, :content, :title, :text, :parent, :level, :content_size
  
  def initialize(options)
    self.children = options[:children] || []
    self.content = options[:content] || []
    self.title = options[:title] || ''
    self.text = ''
    self.parent = options[:parent] || nil
    self.level = options[:level] || 0
    self.content_size = self.content.size
  end

  def parse
    buffer = []
    previous_title = nil
    i = 0
    while i < content.size
      line = content[i]
      log '-'*10
      log "[#{i}] Current line is = #{line}"
      if title?(line)
        clevel = get_level(line)
        if level+1 == clevel && previous_title
          log 'spawn new instance - level is matching, also got previous title'
          log "title = #{previous_title}"
          log "buffer = #{buffer.join}"
          self.children = self.children << new_toc(previous_title, buffer)
          previous_title = line
          buffer = []
        elsif level+1 == clevel
          log "it's new previous title - level is matching, but there's no previous title"
          log "content of buffer flushed to @text = it's my text!"
          self.text = buffer.join 
          log "parent.text = #{self.text}"
          buffer = []
          previous_title = line
        else
          log "put to buffer - level is unmatching"
          buffer << line
        end
      else
        log "put to buffer - just text"
        buffer << line
      end
      if last_line?(i) && previous_title
        log "last line!!!"
        log 'spawn new instance - level is matching, also got previous title'
        log "title = #{previous_title}"
        log "buffer = \n#{buffer.join}"

        self.children = self.children << new_toc(previous_title, buffer)
      elsif last_line?(i)
        self.text = buffer.join 
      end          
      i += 1
    end
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
    str + (level != 0 ? title + text : '') + @children.map{|c| c.render}.join
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

  def log(str)
    Rails.logger.debug "\t"*level+str
  end
  
  def title?(line)
    line =~ /^\*/
  end

  def get_level(line)
    line.count('*')
  end

  def new_toc(title, content)
    new_toc_hash = {
      parent: self,
      level: level+1,
      content: content,
      title: sanitaze_heading(title)
    }
    new_toc = OrgToc.new(new_toc_hash)
  end

  def last_line?(i)
    log " last_line = #{i}/#{self.content_size}"
    i == self.content_size - 1
  end

end

