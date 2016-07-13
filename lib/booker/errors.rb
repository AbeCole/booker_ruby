module Booker
  class Error < StandardError
    attr_accessor :error, :description, :url, :request, :response, :argument_errors

    def initialize(url: nil, request: nil, response: nil)
      if request.present?
        self.request = request
      end

      if response.present?
        self.response = response
        self.error = response['error'] || response['ErrorMessage']
        self.description = response['error_description']
        self.argument_errors = response["ArgumentErrors"].map { |a| { :attr => a["ArgumentName"], :message => a["ErrorMessage"] } }
      end

      self.url = url
    end
  end

  class InvalidApiCredentials < Error; end
end
