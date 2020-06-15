# Import modules
require "./Common.rb"

#  This example demonstrates how to extract images from container item.
class ExtractImagesFromADocumentInsideAContainer
  def self.Run()
    parseApi = GroupDocsParserCloud::ParseApi.from_config($config)
    options = GroupDocsParserCloud::ImagesOptions.new
    options.file_info = GroupDocsParserCloud::FileInfo.new
    options.file_info.file_path = "pdf/PDF with attachements.pdf"
    options.file_info.password = "password"

    container_info = GroupDocsParserCloud::ContainerItemInfo.new
    container_info.relative_path = "template-document.pdf"
    options.container_item_info = container_info

    options.start_page_number = 1
    options.count_pages_to_extract = 2

    request = GroupDocsParserCloud::ImagesRequest.new(options)
    response = parseApi.images(request)
    response.pages.each do |page|
      puts("Images from " + page.page_index.to_s + " page.")
      page.images.each do |image|
        puts("Image path in storage: " + image.path + ". Download url: " + image.download_url)
        puts("Image format: " + image.file_format + ". Page index: " + image.page_index.to_s)
      end
    end
  end
end
