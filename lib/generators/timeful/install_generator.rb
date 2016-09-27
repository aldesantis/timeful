# frozen_string_literal: true
module Timeful
  class InstallGenerator < Rails::Generators::Base # rubocop:disable Style/Documentation
    source_root File.expand_path('../templates', __FILE__)

    def copy_initializer_file
      rake 'timeful:install:migrations'
    end
  end
end
