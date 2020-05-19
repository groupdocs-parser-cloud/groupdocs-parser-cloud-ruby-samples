# Import modules
require "./Common.rb"

#  This example demonstrates how to extract text from whole document.
class ExtractTextFromTheWholeDocument
  def self.Run()
    parseApi = GroupDocsParserCloud::ParseApi.from_config($config)
    options = GroupDocsParserCloud::TextOptions.new
    options.file_info = GroupDocsParserCloud::FileInfo.new
    options.file_info.file_path = "email/eml/embedded-image-and-attachment.eml"

    request = GroupDocsParserCloud::TextRequest.new(options)
    response = parseApi.text(request)
    puts("Text: " + response.text)
  end
end
