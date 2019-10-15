require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379' }
end

class HardWorker
  include Sidekiq::Worker

  def perform
    raise
  end
end

Sidekiq::Client.push_bulk('class' => HardWorker, 'args' => [[]])
