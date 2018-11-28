module Timetable
  module Repository
    # This module provide functionality for repository based on mongodb
    module MongoidRepository
      include Base

      # Reload timetable
      # @see #reinitialize_db
      # @see #get_timetable_from
      def reload_timetable
        reinitialize_db
        hash_data = get_timetable_from(timetable_url, :hash)
        insert_hash_into_db(hash_data)
      end

      # Create indexes for models of require types
      def create_indexes_for_all_models
        required_types.values.each do |required_type_class_object|
          required_type_class_object.send(:create_indexes)
        end
      end

      # Insert hash into db with transcation
      # @param hash [Hash<Symbol, Array<Hash>>] Hash with records for collections
      def insert_hash_into_db(hash)
        with_transaction do
          hash.each do |collection, records|
            client[collection].insert_many(records)
          end
        end
      end


      def with_transaction(&block)
        validate block
        should_be_instance_of(:block, block, Proc)
        with_session do |session, client|
          session.start_transaction
          block.call session, client
          session.commit_transaction
        end
      end

      def client(name = :default)
        Mongoid.client(name)
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
        should_be_instance_of(:block, block, Proc)
        client = Mongoid.client(:default)
        session = client.start_session
        begin
          block.call session, client
          session.end_session
        rescue Mongo::Error => e
          catch_session_error(e, block)
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

      # Drop database completely with system info
      def drop_db
        Mongoid.purge!
      end

      # Parse session error, execute new session with passed block if error
      # is not fatal and raise else
      # @param [Error] error - error from session
      # @param [Proc, Block] block - block for execution if all is OK
      # @see #with_session
      def catch_session_error(error, &block)
        if error.label?(Mongo::Error::UNKNOWN_TRANSACTION_COMMIT_RESULT_LABEL)
          with_session(block)
        end
        raise error
      end
    end
  end
end
