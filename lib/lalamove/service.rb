require 'lalamove/helper'

module Lalamove
  class Service
    def quotation(payload)
      Helper.request('/v2/quotations', payload, "POST")
    end
  end
end
