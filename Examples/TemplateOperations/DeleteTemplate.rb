# Import modules
require "./Common.rb"

#  This example demonstrates how to delete template file from storage.
class DeleteTemplate
  def self.Run()
    # For example purposes create template if not exists.
    Common.CreateIfNotExists("templates/companies.json")
    templateApi = GroupDocsParserCloud::TemplateApi.from_config($config)
    options = GroupDocsParserCloud::TemplateOptions.new
    options.template_path = "templates/template-for-companies.json"

    request = GroupDocsParserCloud::DeleteTemplateRequest.new(options)
    response = templateApi.delete_template(request)
    puts("Done.")
  end
end
