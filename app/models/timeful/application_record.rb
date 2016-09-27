# frozen_string_literal: true
module Timeful
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
