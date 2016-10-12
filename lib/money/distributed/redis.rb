require 'redis'
require 'connection_pool'

class Money
  module Distributed
    # Wrapper over different parameters that can be provided for redis
    class Redis
      def initialize(redis)
        @redis_proc = build_redis_proc(redis)
      end

      def exec(&block)
        @redis_proc.call(&block)
      end

      private

      # rubocop: disable Metrics/MethodLength
      def build_redis_proc(redis)
        case redis
        when ::Redis
          proc { |&b| b.call(redis) }
        when ConnectionPool
          proc { |&b| redis.with { |r| b.call(r) } }
        when Hash
          build_redis_proc(::Redis.new(redis))
        when Proc
          redis
        else
          raise ArgumentError, 'Redis, ConnectionPool, Hash or Proc is required'
        end
      end
      # rubocop: enable Metrics/MethodLength
    end
  end
end
