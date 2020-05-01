# frozen_string_literal: true

require 'lalamove/configuration'
require 'lalamove/order'
require 'lalamove/service'
require 'lalamove/helper'

# Lalamove
module Lalamove
  class << self
    attr_accessor :configuration
  end

  def self.config
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(config)
  end
end
