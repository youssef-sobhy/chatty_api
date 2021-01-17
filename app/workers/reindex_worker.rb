class ReindexWorker
  include Sidekiq::Worker

  def perform(class_name:)
    Searchkick::ProcessQueueJob.perform_later(class_name: class_name)
  end
end
