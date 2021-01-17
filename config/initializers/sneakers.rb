require 'sneakers'
require 'sneakers/handlers/maxretry'

Sneakers.configure exchange: ENV['SNEAKERS_AMQP_EXCHANGE'],
                   exchange_type: :direct,
                   durable: true,
                   ack: true,
                   amqp: ENV['RABBITMQ_URI'],
                   env: ENV['RAILS_ENV'],
                   retry_max_times: 5,
                   timeout_job_after: 5.minutes,
                   heartbeat: 5,
                   handler: Sneakers::Handlers::Maxretry,
                   workers: ENV['SNEAKERS_WORKERS'].to_i,
                   threads: ENV['SNEAKERS_THREADS'].to_i,
                   prefetch: ENV['SNEAKERS_PREFETCH'].to_i

Sneakers.logger.level = Logger::INFO
