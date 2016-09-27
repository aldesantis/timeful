# frozen_string_literal: true
module Timeful
  class ApplicationRecord < ActiveRecord::Base # rubocop:disable Style/Documentation
    self.abstract_class = true
  end
end
