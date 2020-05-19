# Import modules
require "./Common.rb"

#  This example demonstrates how to parse a document placed inside a container.
class ParseByTemplateOfADocumentInsideAContainer
  def self.Run()
    parseApi = GroupDocsParserCloud::ParseApi.from_config($config)
    options = GroupDocsParserCloud::ParseOptions.new
    options.file_info = GroupDocsParserCloud::FileInfo.new
    options.file_info.file_path = "containers/archive/companies.zip"
    container_info = GroupDocsParserCloud::ContainerItemInfo.new
    container_info.relative_path = "companies.docx"
    options.container_item_info = container_info
    options.template = Common.GetTemplate()

    request = GroupDocsParserCloud::ParseRequest.new(options)
    response = parseApi.parse(request)
    response.fields_data.each do |data|
      unless data.page_area.page_text_area.nil?
        puts("Field name: " + data.name + ". Text :" + data.page_area.page_text_area.text)
      end
      unless data.page_area.page_table_area.nil?
        puts("Table name: " + data.name)
        data.page_area.page_table_area.page_table_area_cells do |cell|
          puts("Table cell. Row " + cell.row_index + " column " + cell.column_index + ". Text: " + cell.page_area.page_text_area.text)
        end
      end
    end
  end
end
