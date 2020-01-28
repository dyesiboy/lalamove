# frozen_string_literal: true

require 'lalamove/helper'

module Lalamove
  # Service
  class Service
    def self.quotation(payload)
      Helper.request('/v2/quotations', payload, 'POST')
    end
  end
end
