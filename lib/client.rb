require 'active_support'
require 'active_support/core_ext'

module Yapi
  class YahooError < Exception; end
    
  class Client
    attr_accessor :api_key
    
    def initialize(api_key)
      self.api_key = api_key
    end
    
    def get_api_key
      return self.api_key
    end
    
    def build_url(options = {})
      url = ""
      options.each do |key, value|
        url << "&" << key.id2name << "=" << value
      end
      return URI.escape(url)
    end
    
    def xml_to_json xml
      doc = Hash.from_xml xml
      return JSON.parse(doc.to_json, symbolize_names: true)
    end
  end
end