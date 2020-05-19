# Import modules
require "./Common.rb"

#  This example demonstrates how to obtain container items information.
class GetContainerItemsInformation
  def self.Run()
    infoApi = GroupDocsParserCloud::InfoApi.from_config($config)
    options = GroupDocsParserCloud::ContainerOptions.new
    options.file_info = GroupDocsParserCloud::FileInfo.new
    options.file_info.file_path = "containers/archive/zip.zip"

    request = GroupDocsParserCloud::ContainerRequest.new(options)
    response = infoApi.container(request)
    response.container_items.each do |item|
      puts("Name: " + item.name + ". FilePath: " + item.file_path)
    end
  end
end
