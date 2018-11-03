require 'mongoid'

task drop_mongodb: :environment do
  Mongoid.purge!
end