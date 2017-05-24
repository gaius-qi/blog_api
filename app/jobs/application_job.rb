class ApplicationJob < ActiveJob::Base
  queue_as :default

  def perform(name, count)
    # do something
  end
end
