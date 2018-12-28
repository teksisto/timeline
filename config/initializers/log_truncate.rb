module LogTruncater
  def render_bind(attr, value)
    num_chars = Integer(ENV['ACTIVERECORD_SQL_LOG_MAX_VALUE']) rescue 120
    half_num_chars = num_chars / 2

    if attr.is_a?(Array)
      attr = attr.first
    elsif attr.type.binary? && attr.value
      value = "<#{attr.value_for_database.to_s.bytesize} bytes of binary data>"
    end

    if value.is_a?(String) && value.size > num_chars
      value = "#{value[0,half_num_chars]} [REDACTED #{value.size - num_chars} chars] #{value[-half_num_chars,half_num_chars]}"
    end

    [attr && attr.name, value]
  end

end

class ActiveRecord::LogSubscriber
  prepend LogTruncater
end
