# Import modules
require "./Common.rb"

#  This example demonstrates how to get template file from storage.
class GetTemplate
  def self.Run()
    # For example purposes create template if not exists.
    Common.CreateIfNotExists("templates/template-for-companies.json")
    templateApi = GroupDocsParserCloud::TemplateApi.from_config($config)
    options = GroupDocsParserCloud::TemplateOptions.new
    options.template_path = "templates/template-for-companies.json"

    request = GroupDocsParserCloud::GetTemplateRequest.new(options)
    template = templateApi.get_template(request)
    template.fields.each do |field|
      print("Field: " + field.field_name)
    end
    template.tables.each do |table|
      print("Field: " + table.table_name)
    end
  end
end
