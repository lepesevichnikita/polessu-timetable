class RecordsCreatingWorker
  include Sidekiq::Worker

  def perform(records, records_type)
    records.each do |record|
      TimetableReader.create_records(records, records_type)
    end
  end
end
