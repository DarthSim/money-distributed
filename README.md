![CI](https://github.com/swiknaba/money-distributed/workflows/CI/badge.svg)

# money-distributed
Money gem extension for distributed systems

<hr />

More or less maintained fork of the original gem. Use at your own risk :warning:

<hr />

Money gem [docs](https://github.com/RubyMoney/money/wiki/Stores)

example usage in conjunction with [Open Exchange Rates](https://openexchangerates.org/),
which offers a free API:

>
> Our popular Free Plan provides hourly updates (with base currency USD) and up to 1,000 requests/month.
>

There is a gem available for OXR: https://github.com/spk/money-open-exchange-rates/

```ruby
# config/initializers/money.rb

redis = Redis.new(url: ENV.fetch('REDIS_URL') { 'redis://localhost:6379/1' })
store = Money::Distributed::Storage.new(redis)

# we fetch rates from Open Exchange Rates: 
oxr = Money::Bank::OpenExchangeRatesBank.new(store)
oxr.app_id = Rails.application.credentials.dig(:oxr, :api_key)

# fetch fresh rates if cache is empty so we don't boot the app without available rates
# we fetch those async to avoid the app crashing on boot due to an API error of OXR
Cron::MoneyUpdateRatesWorker.perform_async if oxr.rates.blank?

# to use the free plan of OXR, we must default to USD
oxr.source = 'USD'

Money.default_bank = oxr
```
