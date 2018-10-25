require 'nokogiri'
require 'open-uri'

class TimetableReader
  TIMETABLE_URL = "http://www.polessu.by/ruz/tt.xml"
  REQUIRED_TYPES = [
    :period,
    :daysdef,
    :weeksdef,
    :termsdef,
    :subject,
    :teacher,
    :classroom,
    :grade,
    :class, #it is group
    :group, #it is groups part
    :lesson,
    :card
  ]

  attr_reader :xml_data

  def initialize
    load_xml
  end

  def parse_xml
    REQUIRED_TYPES.each do |required_type|
      @xml_data.xpath("//#{ required_type }").each do |node_with_item_of_required_type|
        process_node node_with_item_of_required_type
      end
    end
  end

  def process_node(node)
    node = node.to_h.deep_symbolize_keys
    print "#{ node }\n"
  end

  def load_xml
    @xml_data = Nokogiri::HTML(open(TIMETABLE_URL))
  end


end
