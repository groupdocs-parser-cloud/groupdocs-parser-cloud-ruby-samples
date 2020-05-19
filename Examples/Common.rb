
$config = ""

class Common
  def self.UploadSampleFiles()
    @TestFiles = Dir.glob("Resources/**/*.*")

    # Api initialization
    storageApi = GroupDocsParserCloud::StorageApi.from_config($config)
    fileApi = GroupDocsParserCloud::FileApi.from_config($config)

    puts("Files Count: " + ((@TestFiles).length).to_s)
    @TestFiles.each do |item|
      dstPath = item.gsub("Resources/", "")
      puts("File to Upload: " + dstPath)
      fileExistRequest = GroupDocsParserCloud::ObjectExistsRequest.new(dstPath)
      fileExistsResponse = storageApi.object_exists(fileExistRequest)
      if fileExistsResponse.exists == false
        file = File.open(item, "r")
        uploadRequest = GroupDocsParserCloud::UploadFileRequest.new(dstPath, file)
        fileApi.upload_file(uploadRequest)
        puts("Uploaded missing file: " + item)
      end
    end

    puts("File Uploading completed..")
  end

  def self.GetTemplate()
    field1 = GroupDocsParserCloud::Field.new
    field1.field_name = "Address"
    fieldPosition1 = GroupDocsParserCloud::FieldPosition.new
    fieldPosition1.field_position_type = "Regex"
    fieldPosition1.regex = "Company address:"
    field1.field_position = fieldPosition1
    field2 = GroupDocsParserCloud::Field.new
    field2.field_name = "CompanyAddress"
    fieldPosition2 = GroupDocsParserCloud::FieldPosition.new
    fieldPosition2.field_position_type = "Linked"
    fieldPosition2.linked_field_name = "ADDRESS"
    fieldPosition2.is_right_linked = true
    size2 = GroupDocsParserCloud::Size.new
    size2.width = 100
    size2.height = 10
    fieldPosition2.search_area = size2
    fieldPosition2.auto_scale = true
    field2.field_position = fieldPosition2
    field3 = GroupDocsParserCloud::Field.new
    field3.field_name = "Company"
    fieldPosition3 = GroupDocsParserCloud::FieldPosition.new
    fieldPosition3.field_position_type = "Regex"
    fieldPosition3.regex = "Company name:"
    field3.field_position = fieldPosition3
    field4 = GroupDocsParserCloud::Field.new
    field4.field_name = "CompanyName"
    fieldPosition4 = GroupDocsParserCloud::FieldPosition.new
    fieldPosition4.field_position_type = "Linked"
    fieldPosition4.linked_field_name = "Company"
    fieldPosition4.is_right_linked = true
    size4 = GroupDocsParserCloud::Size.new
    size4.width = 100
    size4.height = 10
    fieldPosition4.search_area = size4
    fieldPosition4.auto_scale = true
    field4.field_position = fieldPosition4
    table = GroupDocsParserCloud::Table.new
    table.table_name = "Companies"
    detectorparams = GroupDocsParserCloud::DetectorParameters.new
    rect = GroupDocsParserCloud::Rectangle.new
    size = GroupDocsParserCloud::Size.new
    size.height = 60
    size.width = 480
    position = GroupDocsParserCloud::Point.new
    position.x = 77
    position.y = 279
    rect.size = size
    rect.position = position
    detectorparams.rectangle = rect
    table.detector_parameters = detectorparams
    fields = [field1, field2, field3, field4]
    tables = [table]
    template = GroupDocsParserCloud::Template.new
    template.fields = fields
    template.tables = tables
    template
  end

  def self.CreateIfNotExists(file_path)
    storageApi = GroupDocsParserCloud::StorageApi.from_config($config)
    fileExistsResponse = storageApi.object_exists(GroupDocsParserCloud::ObjectExistsRequest.new(file_path))
    if !fileExistsResponse.exists
      options = GroupDocsParserCloud::CreateTemplateOptions.new
      template = Common.GetTemplate()
      options.template = template
      options.template_path = file_path
      createRequest = GroupDocsParserCloud::CreateTemplateRequest.new(options)
      templateApi = GroupDocsParserCloud::TemplateApi.from_config($config)
      templateApi.create_template(createRequest)
    end
  end
end
