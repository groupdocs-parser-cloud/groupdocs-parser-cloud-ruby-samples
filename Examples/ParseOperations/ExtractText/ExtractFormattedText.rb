# Import modules
require "./Common.rb"

#  This example demonstrates how to extract formatted text from document.
class ExtractFormattedText
  def self.Run()
    parseApi = GroupDocsParserCloud::ParseApi.from_config($config)
    options = GroupDocsParserCloud::TextOptions.new
    options.file_info = GroupDocsParserCloud::FileInfo.new
    options.file_info.file_path = "words-processing/docx/formatted-document.docx"

    text_options = GroupDocsParserCloud::FormattedTextOptions.new
    text_options.mode = "Markdown"
    options.formatted_text_options = text_options

    request = GroupDocsParserCloud::TextRequest.new(options)
    response = parseApi.text(request)
    puts("Text:" + response.text)
  end
end
