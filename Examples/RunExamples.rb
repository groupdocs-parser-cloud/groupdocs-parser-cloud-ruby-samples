require "groupdocs_parser_cloud"
require "./Common.rb"

# Get your app_sid and app_key at https://dashboard.groupdocs.cloud (free registration is required).
$app_sid = "XXXXXXXXXXXXXXX"
$app_key = "XXXXXXXXXXXXXXX"

$config = GroupDocsParserCloud::Configuration.new($app_sid, $app_key)
$config.api_base_url = "https://api.groupdocs.cloud"

class RunExamples

  # Uploading sample test files from local disk to cloud storage
  Common.UploadSampleFiles()

  require "./InfoOperations/GetSupportedFormats.rb"
  GetSupportedFormats.Run()
  require "./InfoOperations/GetDocumentInformation.rb"
  GetDocumentInformation.Run()
  require "./InfoOperations/GetContainerItemsInformation.rb"
  GetContainerItemsInformation.Run()

  require "./ParseOperations/ExtractImages/ExtractImagesByAPageNumberRange.rb"
  ExtractImagesByAPageNumberRange.Run()
  require "./ParseOperations/ExtractImages/ExtractImagesFromADocumentInsideAContainer.rb"
  ExtractImagesFromADocumentInsideAContainer.Run()
  require "./ParseOperations/ExtractImages/ExtractImagesFromTheWholeDocument.rb"
  ExtractImagesFromTheWholeDocument.Run()

  require "./ParseOperations/ExtractText/ExtractFormattedText.rb"
  ExtractFormattedText.Run()
  require "./ParseOperations/ExtractText/ExtractTextByAPageNumberRange.rb"
  ExtractTextByAPageNumberRange.Run()
  require "./ParseOperations/ExtractText/ExtractTextFromADocumentInsideAContainer.rb"
  ExtractTextFromADocumentInsideAContainer.Run()
  require "./ParseOperations/ExtractText/ExtractTextFromTheWholeDocument.rb"
  ExtractTextFromTheWholeDocument.Run()

  require "./ParseOperations/ParseByTemplate/ParseByTemplateDefinedAsAnObject.rb"
  ParseByTemplateDefinedAsAnObject.Run()
  require "./ParseOperations/ParseByTemplate/ParseByTemplateOfADocumentInsideAContainer.rb"
  ParseByTemplateOfADocumentInsideAContainer.Run()
  require "./ParseOperations/ParseByTemplate/ParseByTemplateStoredInUserStorage.rb"
  ParseByTemplateStoredInUserStorage.Run()

  require "./TemplateOperations/CreateOrUpdateTemplate.rb"
  CreateOrUpdateTemplate.Run()
  require "./TemplateOperations/DeleteTemplate.rb"
  DeleteTemplate.Run()
  require "./TemplateOperations/GetTemplate.rb"
  GetTemplate.Run()
end
