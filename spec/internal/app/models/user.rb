class User < ActiveRecord::Base
  include Timeful::Model::Actor
  include Timeful::Model::Subscriber
end
