# Import modules
require "./Common.rb"

#  This example demonstrates how to extract text from container item.
class ExtractTextFromADocumentInsideAContainer
  def self.Run()
    parseApi = GroupDocsParserCloud::ParseApi.from_config($config)
    options = GroupDocsParserCloud::TextOptions.new
    options.file_info = GroupDocsParserCloud::FileInfo.new
    options.file_info.file_path = "pdf/PDF with attachements.pdf"
    options.file_info.password = "password"

    container_info = GroupDocsParserCloud::ContainerItemInfo.new
    container_info.relative_path = "template-document.pdf"
    options.container_item_info = container_info
    options.start_page_number = 2
    options.count_pages_to_extract = 1

    request = GroupDocsParserCloud::TextRequest.new(options)
    response = parseApi.text(request)
    puts("Text: " + response.pages[0].text)
  end
end
