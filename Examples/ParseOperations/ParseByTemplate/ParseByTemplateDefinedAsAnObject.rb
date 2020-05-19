# Import modules
require "./Common.rb"

#  This example demonstrates how to parse a document using template object.
class ParseByTemplateDefinedAsAnObject
  def self.Run()
    parseApi = GroupDocsParserCloud::ParseApi.from_config($config)
    options = GroupDocsParserCloud::ParseOptions.new
    options.file_info = GroupDocsParserCloud::FileInfo.new
    options.file_info.file_path = "words-processing/docx/companies.docx"
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
