# frozen_string_literal: true
module Timeful
  class RelationProxy < SimpleDelegator
    def find_each(*args)
      return __getobj__.find_each(*args) if __getobj__.respond_to?(:find_each)
      each { |val| yield val }
    end
  end
end
