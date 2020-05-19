# Import modules
require './Common.rb'

# This example demonstrates how to obtain all supported document formats
class GetSupportedFormats
    def self.Run()        
        infoApi = GroupDocsParserCloud::InfoApi.from_config($config)
        result = infoApi.get_supported_file_formats()
        puts("Formats count: " + result.formats.length.to_s)
    end
end