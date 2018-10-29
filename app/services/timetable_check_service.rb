require 'uri'
require 'net/http'
require 'json'

module TimetableCheckService
  def is_new_timetable?
    is_new = true
    if !TimetableFileInfo.last.nil?
      is_new = TimetableCheckService::modified_sience?(last_timetable_datetime_with_zone)
    end
    is_new
  end

  def modified_sience?(datetime_string)
    last_modified != datetime_string
  end

  def last_modified
    url = TimetableCheckService::make_uri
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Head.new(url)
    request["if-modified-since"] = ""
    response = http.request(request)
    response["last-modified"]
  end

  def make_uri
    URI(Timetable::TIMETABLE_URL)
  end

  def last_timetable_datetime_with_zone
    TimetableFileInfo.last.last_modified
  end

  module_function :is_new_timetable?
  module_function :modified_sience?
  module_function :last_modified
  module_function :make_uri
  module_function :last_timetable_datetime_with_zone
end