task check_timetable: :environment do
  puts 'Checking of new timetable...'
  CheckTimetableJob.perform_later
  puts 'End of timetables checking'
end
