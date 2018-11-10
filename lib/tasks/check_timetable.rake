task check_timetable: [:environment, 'mongoid_search:index'] do
  puts "Checking of new timetable..."
  CheckTimetableJob.perform_later
  puts "End of timetables checking"
end