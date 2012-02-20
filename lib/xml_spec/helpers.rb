require 'nokogiri'

module XmlSpec
  module Helpers
    extend self
    
    def parse_xml(subject, pattern)
      [Nokogiri::XML.parse(subject).root, Nokogiri::XML.parse(pattern).root]
    end
    
  end
end


