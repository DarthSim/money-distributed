require 'spec_helper'

describe Money::Distributed::Storage do
  let(:redis) { Redis.new }
  let(:ttl) { 3600 }

  subject { described_class.new(redis, ttl) }

  it 'stores rates in redis' do
    subject.add_rate 'USD', 'RUB', 60.123
    expect(redis.hget(described_class::REDIS_KEY, 'USD_TO_RUB')).to eq '60.123'
  end

  it 'gets rates from redis' do
    redis.hset(described_class::REDIS_KEY, 'USD_TO_RUB', 60.123)
    expect(subject.get_rate('USD', 'RUB')).to eq 60.123
  end

  it 'caches rates in memory' do
    redis.hset(described_class::REDIS_KEY, 'USD_TO_RUB', 60.123)
    subject.get_rate('USD', 'RUB')
    redis.hset(described_class::REDIS_KEY, 'USD_TO_RUB', 70.456)

    expect(subject.get_rate('USD', 'RUB')).to eq 60.123
  end

  it 'clears rates cache after ttl' do
    redis.hset(described_class::REDIS_KEY, 'USD_TO_RUB', 60.123)
    subject.get_rate('USD', 'RUB')
    redis.hset(described_class::REDIS_KEY, 'USD_TO_RUB', 70.456)

    Timecop.freeze(Time.now + ttl + 1)
    expect(subject.get_rate('USD', 'RUB')).to eq 70.456
  end
end
