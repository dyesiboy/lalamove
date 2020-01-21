module Lalamove
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates lalamove initializer for your application"

      def copy_initializer
        template "lalamove_initializer.rb", "config/initializers/lalamove.rb"

        puts "Install complete! Truly Outrageous!"
      end
    end
  end
end
