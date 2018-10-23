require "redis"

redis_config = YAML::load(
  ERB.new(
    File.open("#{Rails.root.to_s}/config/redis.yml").read
  ).result
)

$redis = Redis.new(redis_config[Rails.env]) unless redis_config[Rails.env].nil?
