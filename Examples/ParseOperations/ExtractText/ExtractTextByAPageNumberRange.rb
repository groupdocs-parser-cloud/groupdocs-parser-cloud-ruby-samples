# Import modules
require "./Common.rb"

#  This example demonstrates how to extract text from pages range.
class ExtractTextByAPageNumberRange
  def self.Run()
    parseApi = GroupDocsParserCloud::ParseApi.from_config($config)
    options = GroupDocsParserCloud::TextOptions.new
    options.file_info = GroupDocsParserCloud::FileInfo.new
    options.file_info.file_path = "cells/two-worksheets.xlsx"
    options.start_page_number = 1
    options.count_pages_to_extract = 1

    request = GroupDocsParserCloud::TextRequest.new(options)
    response = parseApi.text(request)
    response.pages.each do |page|
      puts("PageIndex: " + page.page_index.to_s + ". Text: " + page.text)
    end
  end
end
