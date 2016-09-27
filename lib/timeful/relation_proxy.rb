# frozen_string_literal: true
module Timeful
  # Makes +Array+ behave much like +ActiveRecord::Relation+.
  #
  # This proxy class wraps an +Array+ or +ActiveRecord::Relation+ instance and makes the former
  # behave like the latter by simulating methods like +find_each+.
  #
  # @author Alessandro Desantis
  class RelationProxy < SimpleDelegator
    # If +find_each+ is defined on the object we're delegating to (i.e. the object is an instance
    # of +ActiveRecord::Relation+), calls it on the object.
    #
    # Otherwise, calls +each+ on the object and yields the values.
    #
    # @yieldparam item [Object] the items in the object
    def find_each(*args)
      return __getobj__.find_each(*args) if __getobj__.respond_to?(:find_each)
      each { |item| yield item }
    end
  end
end
