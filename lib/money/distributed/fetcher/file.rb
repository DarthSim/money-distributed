require 'json'
require 'open-uri'
require 'money/distributed/fetcher/base'

class Money
  module Distributed
    module Fetcher
      # Fetcher that loads rates from a file
      class File < Base
        def initialize(file_path, bank = nil)
          super(bank)
          @file_path = file_path
        end

        private

        def exchange_rates
          data = JSON.parse(open(@file_path).read)
          data.each_with_object({}) do |(code, rate), h|
            h[code] = BigDecimal.new(rate.to_s)
          end
        end
      end
    end
  end
end
