module Timetable
  module Repository
    # Module Timetable::Repository::Mongoid
    # This module provide functionality for repository based on mongodb
    module Mongoid
      extend Base

      def self.reload_timetable
        reinitialize_db
        json_data = get_timetable_from(url, :json)
      end

      def self.create_indexes_for_all_models
        REQUIRED_TYPES.values.each do |required_type_class_object|
          required_type_class_object.send(:create_indexes)
        end
      end

      def self.load_json_into_db_through_shell(json)
      end

      def self.with_transaction(&block)
        validate block
        should_be_instance_of(:block, block, Proc)
        with_session do |session|
          session.start_transaction
          block.call session
          session.commit_transaction
        end
      end

      def self.with_session(&block)
        validate(block)
        should_be_instance_of(:block, block, Proc)
        session = Mongoid.client(:default).start_session
        begin
          block.call(session)
          session.end_session
        rescue Mongo::Error => e
          parse_session_error(e, block)
          session.abort_transaction
        end
      end

      def self.initialize_db
        create_indexes_for_all_models
      end

      def self.reinitialize_db
        drop_db
        initialize_db
      end

      def self.drop_db
        Mongoid.purge!
      end

      def self.parse_session_error(error, block)
        with_session(block) if unknown_transaction_commit_result_label(error)
        raise error
      end

      def self.unknown_transaction_commit_result_label(error)
        error.label?(Mongo::Error::UNKNOWN_TRANSACTION_COMMIT_RESULT_LABEL)
      end

    end
  end
end