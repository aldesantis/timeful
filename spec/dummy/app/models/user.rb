class User < ApplicationRecord
  include Timeful::Model::Actor
  include Timeful::Model::Feedable
end
