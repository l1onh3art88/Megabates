redis_conf = YAML::load(File.read(Rails.root.join("config", "redis.yml")))[Rails.env]
REDIS = Redis.new(redis_conf)