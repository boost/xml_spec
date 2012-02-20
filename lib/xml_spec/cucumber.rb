require File.expand_path("../../xml_spec", __FILE__)

World(XmlSpec::Helpers, XmlSpec::Matchers)

Then /^the response should include the following XML$/ do |xml|  
  last_xml.should include_xml(xml)
end
