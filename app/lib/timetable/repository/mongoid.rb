module Timetable
  module Repository
    # This module provide functionality for repository based on mongodb
    module Mongoid
      include Base

      # Reload timetable
      # @see #reinitialize_db
      # @see #get_timetable_from
      def reload_timetable
        reinitialize_db
        json_data = get_timetable_from(url, :json)
      end

      # Create indexes for models of require types
      def create_indexes_for_all_models
        required_types.values.each do |required_type_class_object|
          required_type_class_object.send(:create_indexes)
        end
      end

      def load_json_into_db_through_shell(json_string)
      end

      def with_transaction(&block)
        validate block
        should_be_instance_of(:block, block, Proc)
        with_session do |session|
          session.start_transaction
          block.call session
          session.commit_transaction
        end
      end

      # Execute passed block in session
      # @example
      #  with_session |session|
      #    session.start_transaction
      #    puts 'hi'
      #    session.commit_transaction
      #  end
      # @param [Proc, Block] block - block for execution
      def with_session(&block)
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

      # Initialize database for future working
      # @see #create_indexes_for_all_models
      def initialize_db
        create_indexes_for_all_models
      end

      # Drop database and initialize
      # @see #drop_db
      # @see #initialize_db
      def reinitialize_db
        drop_db
        initialize_db
      end

      def drop_db
        Mongoid.purge!
      end

      # Parse session error, execute new session with passed block if error
      # is not fatal and raise else
      # @param [Error] error - error from session
      # @param [Proc, Block] block - block for execution if all is OK
      # @see #with_session
      def parse_session_error(error, &block)
        with_session(block) if unknown_transaction_commit_result_label(error)
        raise error
      end

      def unknown_transaction_commit_result_label(error)
        error.label?(Mongo::Error::UNKNOWN_TRANSACTION_COMMIT_RESULT_LABEL)
      end
    end
  end
end
