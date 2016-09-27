# frozen_string_literal: true
module Timeful
  module Model
    module Actor
      def self.included(klass)
        klass.include InstanceMethods
      end

      module InstanceMethods
        def publish_activity(action, object:)
          activity_klass(action).create(object: object, actor: self)
        end

        private

        def activity_klass(action)
          "#{action.to_s.camelize}Activity".constantize
        end
      end
    end
  end
end
