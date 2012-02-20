require "nokogiri"
require "rspec"

module XmlSpec
  module Matchers
    class BeXmlEql
      include XmlSpec::Helpers
      
      attr_reader :expected, :actual

      def diffable?
        true
      end
      
      def initialize(expected_xml)
        @expected_xml = expected_xml
      end

      def matches?(actual_xml)
        @actual, @expected = parse_xml(actual_xml, @expected_xml)
        @actual.match?(@expected, true) && @expected.match?(@actual, true)
      end

      def failure_message_for_should
        "the xml:\n#{@actual}\nshould exactly match xml:\n#{@expected}"
      end

      def failure_message_for_should_not
        "the xml:\n#{@actual}\nshould not exactly match xml:\n#{@expected}\nbut it does"
      end
    end
    
    class IncludeXml
      include XmlSpec::Helpers
      
      attr_reader :expected, :actual

      def initialize(expected_xml)
        @expected_xml = expected_xml
      end

      def matches?(actual_xml)
        @actual, @expected = parse_xml(actual_xml, @expected_xml)
        @actual.match?(expected, true)
      end

      def failure_message_for_should
        "the xml:\n#{@actual}\nshould match xml structure:\n#{@expected}"
      end

      def failure_message_for_should_not
        "the xml:\n#{@actual}\nshould not match xml structure:\n#{@expected}\nbut it does"
      end
    end
    
    def be_xml_eql(xml)
      XmlSpec::Matchers::BeXmlEql.new(xml)
    end
    
    def include_xml(xml)
      XmlSpec::Matchers::IncludeXml.new(xml)
    end
  end
end

RSpec.configure do |config|
  config.include XmlSpec::Matchers
end