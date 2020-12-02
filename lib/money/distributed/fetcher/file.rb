# frozen_string_literal: true

require 'json'
require 'open-uri'
require 'money/distributed/fetcher/base'

class Money
  module Distributed
    module Fetcher
      # Fetcher that loads rates from a file
      class File
        include Base

        def initialize(file_path, bank = nil)
          super(bank)
          @file_path = file_path
        end

        private

        def exchange_rates
          ::File.open(@file_path).read.split("\n").each_with_object({}) do |line, h|
            code_rate = line.split(' ')
            h[code_rate[0]] = BigDecimal(code_rate[1])
          end
        end
      end
    end
  end
end
