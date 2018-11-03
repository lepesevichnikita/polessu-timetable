task check_timetable: :environment do
  puts "Checking of new timetable..."
  CheckTimetableJob.perform_now
  puts "End of timetables checking"
end