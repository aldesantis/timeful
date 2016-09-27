# frozen_string_literal: true
require 'timeful/version'

require 'timeful/relation_proxy'

require 'timeful/model/actor'
require 'timeful/model/subscriber'

require 'timeful/engine'

module Timeful # rubocop:disable Style/Documentation
  # !@attribute [rw]
  #   @return [Symbol] the queue to use for background jobs (default is +default+)
  mattr_accessor :jobs_queue
  self.jobs_queue = :default

  # Yields the module for configuration.
  #
  # @yieldparam config [Timeful] the +Timeful+ module
  #
  # @example
  #   Timeful.configure do |config|
  #     config.jobs_queue = :timeful
  #   end
  def self.configure
    yield self
  end
end
