# Import modules
require "./Common.rb"

#  This example demonstrates how to save template file in storage.
class CreateOrUpdateTemplate
  def self.Run()
    templateApi = GroupDocsParserCloud::TemplateApi.from_config($config)
    options = GroupDocsParserCloud::CreateTemplateOptions.new
    options.template = Common.GetTemplate()
    options.template_path = "templates/template-for-companies.json"

    request = GroupDocsParserCloud::CreateTemplateRequest.new(options)
    response = templateApi.create_template(request)
    puts("Path to saved template in storage: " + response.template_path + ". Link to download template: " + response.url)
  end
end
