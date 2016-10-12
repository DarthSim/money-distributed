require 'spec_helper'

describe Money::Distributed::Redis do
  it 'accepts Redis' do
    redis = Redis.new
    expect(described_class.new(redis).exec(&:ping)).to eq 'PONG'
  end

  it 'accepts ConnectionPool' do
    pool = ConnectionPool.new { Redis.new }
    expect(described_class.new(pool).exec(&:ping)).to eq 'PONG'
  end

  it 'accepts Proc' do
    redis = Redis.new
    redis_proc = proc { |&b| b.call(redis) }
    expect(described_class.new(redis_proc).exec(&:ping)).to eq 'PONG'
  end

  it 'accepts Hash' do
    options = { host: '127.0.0.1', db: 0 }
    expect(described_class.new(options).exec(&:ping)).to eq 'PONG'
  end

  it "doesn't accept other classes" do
    redis = double(ping: true)
    expect { described_class.new(redis).exec(&:ping) }.to \
      raise_error(ArgumentError)
  end
end
