require 'rake'
require 'nokogiri'
require 'open-uri'

class TimetableReader
  TIMETABLE_URL = "http://www.polessu.by/ruz/tt.xml"
  REQUIRED_TYPES = {
    period: Period,
    daysdef: Daysdef,
    weeksdef: Weeksdef,
    termsdef: Termsdef,
    subject: Subject,
    teacher: Teacher,
    classroom: Classroom,
    grade: Grade,
    class: Group, #it is a students group
    group: Part, #it is a groups part
    lesson: Lesson,
    card: Card
  }

  attr_reader :xml_data

  def initialize
    load_xml
    self
  end

  def load_timetable
    REQUIRED_TYPES.keys.each do |required_type|
      load_items required_type
    end
  end

  def load_items required_type
    items_of_required_type = find_items required_type
    RecordsCreatingWorker.perform_async items_to_hash(items_of_required_type), required_type
  end

  def find_items required_type
    @xml_data.xpath("//#{ required_type }")
  end

  def create_records(items, class_object)
    class_object.send(:first_or_create!, items)
  end

  def items_to_hash(set_of_items)
    print "#{ set_of_items }\n" if Rails.env.development?
    set_of_items.map { |item| item.to_h.deep_symbolize_keys }
  end

  def load_xml
    @xml_data = Nokogiri::XML(open(TIMETABLE_URL))
    @xml_data.encoding = 'UTF-8'
  end

  def self.drop_db
    Mongoid.purge!
  end

end
