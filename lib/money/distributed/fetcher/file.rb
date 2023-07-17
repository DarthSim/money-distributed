# typed: strict
# frozen_string_literal: true

require 'json'
require 'open-uri'
require 'money/distributed/fetcher/base'

class Money
  module Distributed
    module Fetcher
      # Fetcher that loads rates from a file
      class File
        extend T::Sig
        include Base

        sig do
          params(
            file_path: T.any(String, Pathname),
            bank: T.untyped
          ).void
        end
        def initialize(file_path, bank = nil)
          super(bank)
          @file_path = file_path
        end

        private

        sig { returns(T::Hash[String, BigDecimal]) }
        def exchange_rates
          ::File.open(@file_path).read.split("\n").each_with_object({}) do |line, h|
            code_rate = line.split(' ')
            currency = T.cast(code_rate[0], String)
            rate = T.cast(code_rate[1], T.any(Integer, Float, Rational, BigDecimal, String))
            h[currency] = BigDecimal(rate)
          end
        end
      end
    end
  end
end
