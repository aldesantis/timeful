# frozen_string_literal: true
module Timeful
  class Activity < ApplicationRecord
    belongs_to :actor, polymorphic: true
    belongs_to :object, polymorphic: true
  end
end
