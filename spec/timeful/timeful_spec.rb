# frozen_string_literal: true
RSpec.describe Timeful do
  describe '.configure' do
    it 'yields the module for configuration' do
      expect {
        described_class.configure do |config|
          config.jobs_queue = :timeful
        end
      }.to change(described_class, :jobs_queue).to(:timeful)
    end
  end
end
