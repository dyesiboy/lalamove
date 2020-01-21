require 'openssl'
require 'base64'
require 'net/http'
require 'httparty'

module Lalamove
  module Helper
    def self.request(path, payload, method)
      timestamp = get_timestamp
      signature = generate_signature(path, method, timestamp, payload)
      token = get_token(key, timestamp, signature)
      headers = get_header(token, timestamp.to_s)
      request_url = request_url(path)

      HTTParty.post(request_url, :headers => headers, :body => payload.to_json.to_s)
    end

    def self.generate_signature(path, method, timestamp, payload)
      generat_raw_signature(method, timestamp, path, payload)
      OpenSSL::HMAC.hexdigest('sha256', @secret, raw_signature)
    end

    def self.generate_raw_signature(method, timestamp,path, payload)
      "#{timestamp}\r\n#{method}\r\n#{path}\r\n\r\n#{payload}"
    end

    def self.get_timestamp
      (Time.now.to_f * 1000).to_i
    end

    def self.get_header(token, timestamp)
      {
        "Authorization" => "hmac #{token}",
        "X-LLM-Country" => "PH", # Lalamove.config.county_code
        "X-Request-ID" => timestamp
      }
    end

    def self.get_token(key, timestamp, signature)
      "#{key}:#{timestamp}:#{signature}"
    end

    def self.request_url(path)
      Lalamove.config.base_url + path
    end

  end
end
