# Import modules
require "./Common.rb"

#  This example demonstrates how to get document information
class GetDocumentInformation
  def self.Run()
    infoApi = GroupDocsParserCloud::InfoApi.from_config($config)
    options = GroupDocsParserCloud::InfoOptions.new
    options.file_info = GroupDocsParserCloud::FileInfo.new
    options.file_info.file_path = "words-processing/docx/password-protected.docx"
    options.file_info.password = "password"

    request = GroupDocsParserCloud::GetInfoRequest.new(options)
    response = infoApi.get_info(request)

    puts("GetDocumentInformation completed: " + response.page_count.to_s)
  end
end
