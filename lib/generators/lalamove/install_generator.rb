class InitializerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../../templates', __dir__)
  desc 'Create Lalamove initializer for your application'

  def copy_initializer_file
    copy_file 'lalamove_initializer.rb', 'config/initializers/lalamove.rb'
    puts 'Install complete! Truly Outrageous!'
  end
end
