# typed: true
# frozen_string_literal: true

class Money
  module Distributed
    # Wrapper over different parameters that can be provided for redis
    class Redis
      extend T::Sig

      sig do
        params(
          redis: T.any(::Redis, ConnectionPool, Hash, Proc)
        ).void
      end
      def initialize(redis)
        @redis_proc = build_redis_proc(redis)
      end

      sig do
        params(
          block: T.proc.returns(T.untyped)
        ).returns(T.untyped)
      end
      def exec(&block)
        @redis_proc.call(&block)
      end

      private

      sig do
        params(
          redis: T.any(::Redis, ConnectionPool, Hash, Proc)
        ).returns(Proc)
      end
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
          T.absurd(redis)
        end
      end
    end
  end
end
