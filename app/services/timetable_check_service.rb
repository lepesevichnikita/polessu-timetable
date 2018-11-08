require 'uri'
require 'net/http'
require 'json'

# Service for checking, is there new or changed timetable.
module TimetableCheckService
  module_function

  # Chech if there is new timetable
  # @return [Boolean] True if there is new or changed timetable, False else
  def new_timetable?
    is_new = true
    unless TimetableFileInfo.last.nil?
      is_new = TimetableCheckService.modified_sience?(last_timetable_datetime_with_zone)
    end
    is_new
  end

  # Check, was the timetable changed sience passed datetime in rfc822-format
  # @return [Boolean] True if passed datetime is not equal to last_modified result
  #  False else
  # @see #last_modified 
  def modified_sience?(datetime_string)
    last_modified != datetime_string
  end

  # Return datetime of last modifying
  # @return [String] Datetime in rfc822
  def last_modified
    url = TimetableCheckService.make_uri
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Head.new(url)
    request['if-modified-since'] = ''
    response = http.request(request)
    response['last-modified']
  end

  def make_uri
    URI(TimetableMongoidRepository.timetable_url)
  end

  # Last known datetime of timetable change
  # @return [String, Nil] Return nil if there is no info about last timetable change,
  #  datetime in rfc822 else
  def last_timetable_datetime_with_zone
    TimetableFileInfo.last.last_modified
  end

end
