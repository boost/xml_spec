require "spec_helper"

describe "Matchers:" do
  context "be_xml_eql" do
    it "matches the exact same XML" do
      xml = %(<name complete="true">TAPUHI</name><count type="integer">1</count>)
      xml.should be_xml_eql(%(<name complete="true">TAPUHI</name><count type="integer">1</count>))
    end
    
    it "doesn't match XML with different attributes" do
      xml = %(<name complete="true">TAPUHI</name><count type="integer">1</count>)
      xml.should_not be_xml_eql(%(<name complete="false">TAPUHI</name><count type="integer">1</count>))
    end
  end
  
  context "include_xml" do
    it "matches a basic xml structure" do
      xml = %(<values type="array">
                <value>
                  <name>TAPUHI</name>
                  <count type="integer">1</count>
                </value>
              </values>)
      
      xml.should include_xml(%(<values type="array"><value><name>TAPUHI</name></value></values>))
    end
    
    it "ignores other nodes" do
      xml = %(<value><name>TAPUHI</name><count type="integer">1</count></value>)
      xml.should include_xml(%(<value><name>TAPUHI</name></value>))
    end
  end
end
