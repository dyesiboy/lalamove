require 'lalamove/helper'

module Lalamove
  class Configuration
    attr_accessor :key, :secret_key
    attr_writer :base_url, :mode
  end

  SANDBOX_BASE_URL = 'https://sandbox-rest.lalamove.com'.freeze
  PROD_BASE_URL = 'https://rest.lalamove.com'.freeze

  def base_url
    return @base_url unless @base_url.nil?
    return SANDBOX_BASE_URL if mode == ':sandbox'
    PROD_BASE_URL
  end

  def mode
    return @mode unless @mode.nil?
    :sandbox
  end

  def quotation(payload)
    Helper.request('/v2/quotations', payload, "POST")
  end
end
