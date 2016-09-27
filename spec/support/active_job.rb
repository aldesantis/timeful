RSpec.configure do |config|
  config.before { ActiveJob::Base.queue_adapter = :test }
end
