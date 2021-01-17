schedule_file = 'config/sidekiq.yml'
redis = { url: (ENV['REDIS_URL'] || 'redis://127.0.0.1') }

Sidekiq.configure_server do |config|
  config.redis = redis
end

Sidekiq.configure_client do |config|
  config.redis = redis
end

if File.exist?(schedule_file)
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end