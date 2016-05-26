class OdfThumb::Document
  attr_reader :source

  def initialize(source)
    unless File.readable? source
      raise ArgumentError.new "Cannot read source file"
    end

    @source = source
  end

  def has_thumb?
    Zip::File.open(source) do |file|
      !!file.find_entry("Thumbnails/thumbnail.png")
    end
  rescue Zip::Error
    false
  end

  def thumbnail
    Zip::File.open(source) do |file|
      file.read("Thumbnails/thumbnail.png")
    end
  rescue Zip::Error, Errno::ENOENT
    nil
  end

  def write_thumbnail_to(target)
    Zip::File.open(source) do |file|
      file.extract("Thumbnails/thumbnail.png", target)
    end
  rescue Zip::Error, Errno::ENOENT
    nil
  end
end
