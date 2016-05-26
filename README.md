# OdfThumb

This gem extracts existing thumbnail files from OpenDocument files, i.e. files
created with OpenOffice or LibreOffice.

It cannot be guaranteed, that such a file exists. Most desktop applications will
create and update such a file, while converters, export tools and command line
utilities might not.

According to
[Wikipedia](https://en.wikipedia.org/w/index.php?title=OpenDocument_technical_specification&oldid=695208884),
the thumbnail

> should be a representation of the first page, first sheet, etc. of the
> document. The required size for the thumbnails is 128x128 pixel. In order to
> conform to the [Thumbnail Managing
> Standard](http://standards.freedesktop.org/thumbnail-spec/latest/x142.html#AEN144)
> (TMS) at www.freedesktop.org, thumbnails must be saved as 8bit, non-interlaced
> PNG image with full alpha transparency.



## Alternative approaches

If these properties do not meet your requirements, try creating a thumbnail
by making use LibreOffice's conversion capabilities. E.g. convert your document
to a PNG and create a thumbnail based on that. The following command will create
a PNG called `Example.png` based on the first page of a OpenDocument text file.

    soffice --headless --convert-to png Example.odt



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'odf_thumb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install odf_thumb



## Command line usage

OdfThumb comes with a command line tool

```
# Creates a path/to/source.png
odf_thumb path/to/source.odt

# Creates a path/to/target/thumb.png
odf_thumb path/to/source.odt -o path/to/target/thumb.png

# Exits with error code 1 if the given file did not contain a thumbnail file
odf_thumb other_file.txt
echo $? # => 1
```



## API usage

```ruby
doc = OdfThumb::Document.new("source.odt")

# Returns true if document contains thumbnail file
doc.has_thumb?

# Returns thumbnail as binary string, nil if has_thumb? == false
doc.thumbnail

# Write thumbnail to given path, does nothing if has_thumb? == false
doc.write_thumbnail_to("thumb.odt")
```



## Development

After checking out the repo, run `bundle install` to install dependencies. Then,
run `rake test` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).



## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/schmidt/odf_thumb. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
