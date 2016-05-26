class OdfThumb::Document
  def initialize(source)
    unless File.readable? source
      raise ArgumentError.new "Cannot read source file"
    end

    @source = source
  end

  def has_thumb?
    false
  end

  def thumbnail
    nil
  end

  def write_thumbnail_to(target)
    nil
  end
end
