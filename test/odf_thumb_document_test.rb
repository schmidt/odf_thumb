require 'test_helper'

class OdfThumbDocumentTest < Minitest::Test
  def target
    @target ||= File.join(Dir.tmpdir, "thumb.png")
  end

  def teardown
    File.unlink(target) if File.exist?(target)
  end





  def test_argument_error_if_source_not_readable
    assert_raises ArgumentError do
      OdfThumb::Document.new("test/fixtures/nothing.odt")
    end
  end





  def test_has_thumb_true_for_odt_files
    doc = OdfThumb::Document.new("test/fixtures/example_with_thumb.odt")
    assert doc.has_thumb?, "has_thumb? should be true"
  end

  def test_has_thumb_false_for_non_zip_files
    doc = OdfThumb::Document.new(__FILE__)
    refute doc.has_thumb?, "has_thumb? should be false"
  end

  def test_has_thumb_false_for_odt_files_wo_thumb
    doc = OdfThumb::Document.new("test/fixtures/example_without_thumb.odt")
    refute doc.has_thumb?, "has_thumb? should be false"
  end





  def test_thumbnail_for_odt_files
    doc = OdfThumb::Document.new("test/fixtures/example_with_thumb.odt")
    thumbnail = doc.thumbnail

    assert thumbnail
    refute_empty thumbnail

    assert_equal File.read("test/fixtures/thumbnail.png"), thumbnail, "Thumbnails differ"
  end

  def test_write_thumbnail_to_returns_nil_for_non_zip_files
    doc = OdfThumb::Document.new(__FILE__)
    thumbnail = doc.thumbnail

    refute thumbnail
  end

  def test_write_thumbnail_to_returns_nil_for_odt_files_wo_thumbnail
    doc = OdfThumb::Document.new("test/fixtures/example_without_thumb.odt")
    thumbnail = doc.thumbnail

    refute thumbnail
  end





  def test_write_thumbnail_to_works_for_odt_files
    doc = OdfThumb::Document.new("test/fixtures/example_with_thumb.odt")
    doc.write_thumbnail_to(target)

    assert File.exist?(target)

    assert_equal File.read("test/fixtures/thumbnail.png"), File.read(target), "Thumbnails differ"
  end

  def test_write_thumbnail_to_returns_nil_for_non_zip_files
    doc = OdfThumb::Document.new(__FILE__)
    doc.write_thumbnail_to(target)

    refute File.exist?(target)
  end

  def test_write_thumbnail_to_returns_nil_for_odt_files_wo_thumbnail
    doc = OdfThumb::Document.new("test/fixtures/example_without_thumb.odt")
    doc.write_thumbnail_to(target)

    refute File.exist?(target)
  end
end
