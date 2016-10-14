require 'money'

class Money
  module Distributed
    module Fetcher
      # Base class for reates fetchers
      module Base
        def initialize(bank = nil)
          @bank = bank || Money.default_bank
        end

        def fetch
          rates = exchange_rates
          currencies = rates.keys

          currencies.each { |cur| add_rate(cur, cur, 1) }

          currencies.combination(2).each do |curr1, curr2|
            rate = rates[curr2] / rates[curr1]
            add_rate(curr1, curr2, rate)
          end
        end

        private

        def add_rate(from_iso, to_iso, rate)
          @bank.add_rate(from_iso, to_iso, rate.round(4))
          return if from_iso == to_iso
          @bank.add_rate(to_iso, from_iso, (1 / rate).round(4))
        end

        def exchange_rates
          raise NotImplementedError
        end
      end
    end
  end
end
