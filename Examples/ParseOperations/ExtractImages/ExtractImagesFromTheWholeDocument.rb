# Import modules
require "./Common.rb"

#  This example demonstrates how to extract images from whole document.
class ExtractImagesFromTheWholeDocument
  def self.Run()
    parseApi = GroupDocsParserCloud::ParseApi.from_config($config)
    options = GroupDocsParserCloud::ImagesOptions.new
    options.file_info = GroupDocsParserCloud::FileInfo.new
    options.file_info.file_path = "slides/three-slides.pptx"

    request = GroupDocsParserCloud::ImagesRequest.new(options)
    response = parseApi.images(request)
    response.images.each do |image|
      puts("Image path in storage: " + image.path + ". Download url: " + image.download_url)
    end
  end
end
