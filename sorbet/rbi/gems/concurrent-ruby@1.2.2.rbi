# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `concurrent-ruby` gem.
# Please instead update this file by running `bin/tapioca gem concurrent-ruby`.

# {include:file:README.md}
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/constants.rb#1
module Concurrent
  extend ::Concurrent::Utility::EngineDetector
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#7
module Concurrent::Collection; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#10
Concurrent::Collection::MapImplementation = Concurrent::Collection::MriMapBackend

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#10
class Concurrent::Collection::MriMapBackend < ::Concurrent::Collection::NonConcurrentMapBackend
  # @return [MriMapBackend] a new instance of MriMapBackend
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#12
  def initialize(options = T.unsafe(nil), &default_proc); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#17
  def []=(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#61
  def clear; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#33
  def compute(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#21
  def compute_if_absent(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#29
  def compute_if_present(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#53
  def delete(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#57
  def delete_pair(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#49
  def get_and_set(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#37
  def merge_pair(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#45
  def replace_if_exists(key, new_value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#41
  def replace_pair(key, old_value, new_value); end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#9
class Concurrent::Collection::NonConcurrentMapBackend
  # WARNING: all public methods of the class must operate on the @backend
  # directly without calling each other. This is important because of the
  # SynchronizedMapBackend which uses a non-reentrant mutex for performance
  # reasons.
  #
  # @return [NonConcurrentMapBackend] a new instance of NonConcurrentMapBackend
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#15
  def initialize(options = T.unsafe(nil), &default_proc); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#21
  def [](key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#25
  def []=(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#94
  def clear; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#59
  def compute(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#29
  def compute_if_absent(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#53
  def compute_if_present(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#81
  def delete(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#85
  def delete_pair(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#99
  def each_pair; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#71
  def get_and_set(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#110
  def get_or_default(key, default_value); end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#77
  def key?(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#63
  def merge_pair(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#46
  def replace_if_exists(key, new_value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#37
  def replace_pair(key, old_value, new_value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#106
  def size; end

  private

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#130
  def dupped_backend; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#124
  def initialize_copy(other); end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#134
  def pair?(key, expected_value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#116
  def set_backend(default_proc); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#138
  def store_computed_value(key, new_value); end
end

# A thread-safe subclass of Hash. This version locks against the object
# itself for every method call, ensuring only one thread can be reading
# or writing at a time. This includes iteration methods like `#each`,
# which takes the lock repeatedly when reading an item.
#
# @see http://ruby-doc.org/core/Hash.html Ruby standard library `Hash`
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/hash.rb#47
class Concurrent::Hash < ::Hash; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/hash.rb#16
Concurrent::HashImplementation = Hash

# `Concurrent::Map` is a hash-like object and should have much better performance
# characteristics, especially under high concurrency, than `Concurrent::Hash`.
# However, `Concurrent::Map `is not strictly semantically equivalent to a ruby `Hash`
# -- for instance, it does not necessarily retain ordering by insertion time as `Hash`
# does. For most uses it should do fine though, and we recommend you consider
# `Concurrent::Map` instead of `Concurrent::Hash` for your concurrency-safe hash needs.
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#39
class Concurrent::Map < ::Concurrent::Collection::MriMapBackend
  # Iterates over each key value pair.
  # This method is atomic.
  #
  # @note Atomic methods taking a block do not allow the `self` instance
  #   to be used within the block. Doing so will cause a deadlock.
  # @return [self]
  # @yield for each key value pair in the map
  # @yieldparam key [Object]
  # @yieldparam value [Object]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#274
  def each; end

  # Iterates over each key.
  # This method is atomic.
  #
  # @note Atomic methods taking a block do not allow the `self` instance
  #   to be used within the block. Doing so will cause a deadlock.
  # @return [self]
  # @yield for each key in the map
  # @yieldparam key [Object]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#255
  def each_key; end

  # Iterates over each key value pair.
  # This method is atomic.
  #
  # @note Atomic methods taking a block do not allow the `self` instance
  #   to be used within the block. Doing so will cause a deadlock.
  # @return [self]
  # @yield for each key value pair in the map
  # @yieldparam key [Object]
  # @yieldparam value [Object]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#274
  def each_pair; end

  # Iterates over each value.
  # This method is atomic.
  #
  # @note Atomic methods taking a block do not allow the `self` instance
  #   to be used within the block. Doing so will cause a deadlock.
  # @return [self]
  # @yield for each value in the map
  # @yieldparam value [Object]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#264
  def each_value; end

  # Is map empty?
  #
  # @return [true, false]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#291
  def empty?; end

  # Get a value with key, or default_value when key is absent,
  # or fail when no default_value is given.
  #
  # @note The "fetch-then-act" methods of `Map` are not atomic. `Map` is intended
  #   to be use as a concurrency primitive with strong happens-before
  #   guarantees. It is not intended to be used as a high-level abstraction
  #   supporting complex operations. All read and write operations are
  #   thread safe, but no guarantees are made regarding race conditions
  #   between the fetch operation and yielding to the block. Additionally,
  #   this method does not support recursion. This is due to internal
  #   constraints that are very unlikely to change in the near future.
  # @param key [Object]
  # @param default_value [Object]
  # @raise [KeyError] when key is missing and no default_value is provided
  # @return [Object] the value or default value
  # @yield default value for a key
  # @yieldparam key [Object]
  # @yieldreturn [Object] default value
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#183
  def fetch(key, default_value = T.unsafe(nil)); end

  # Fetch value with key, or store default value when key is absent,
  # or fail when no default_value is given. This is a two step operation,
  # therefore not atomic. The store can overwrite other concurrently
  # stored value.
  #
  # @param key [Object]
  # @param default_value [Object]
  # @return [Object] the value or default value
  # @yield default value for a key
  # @yieldparam key [Object]
  # @yieldreturn [Object] default value
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#205
  def fetch_or_store(key, default_value = T.unsafe(nil)); end

  # Get a value with key
  #
  # @param key [Object]
  # @return [Object] the value
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#21
  def get(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#321
  def inspect; end

  # Find key of a value.
  #
  # @param value [Object]
  # @return [Object, nil] key or nil when not found
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#284
  def key(value); end

  # All keys
  #
  # @return [::Array<Object>] keys
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#236
  def keys; end

  # @raise [TypeError]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#305
  def marshal_dump; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#313
  def marshal_load(hash); end

  # Set a value with key
  #
  # @param key [Object]
  # @param value [Object]
  # @return [Object] the new value
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#17
  def put(key, value); end

  # Insert value into map with key if key is absent in one atomic step.
  #
  # @param key [Object]
  # @param value [Object]
  # @return [Object, nil] the previous value when key was present or nil when there was no key
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#215
  def put_if_absent(key, value); end

  # Is the value stored in the map. Iterates over all values.
  #
  # @param value [Object]
  # @return [true, false]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#227
  def value?(value); end

  # All values
  #
  # @return [::Array<Object>] values
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#244
  def values; end

  private

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#331
  def initialize_copy(other); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#336
  def populate_from(hash); end

  # @raise [KeyError]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#327
  def raise_fetch_no_key; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#341
  def validate_options_hash!(options); end
end

# Various classes within allows for +nil+ values to be stored,
# so a special +NULL+ token is required to indicate the "nil-ness".
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/constants.rb#6
Concurrent::NULL = T.let(T.unsafe(nil), Object)

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#4
module Concurrent::ThreadSafe; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#7
module Concurrent::ThreadSafe::Util; end

# TODO (pitr-ch 15-Oct-2016): migrate to Utility::ProcessorCounter
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#13
Concurrent::ThreadSafe::Util::CPU_COUNT = T.let(T.unsafe(nil), Integer)

# TODO (pitr-ch 15-Oct-2016): migrate to Utility::NativeInteger
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#10
Concurrent::ThreadSafe::Util::FIXNUM_BIT_SIZE = T.let(T.unsafe(nil), Integer)

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#11
Concurrent::ThreadSafe::Util::MAX_INT = T.let(T.unsafe(nil), Integer)

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#3
module Concurrent::Utility; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#6
module Concurrent::Utility::EngineDetector
  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#7
  def on_cruby?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#11
  def on_jruby?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#27
  def on_linux?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#23
  def on_osx?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#15
  def on_truffleruby?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#19
  def on_windows?; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#31
  def ruby_version(version = T.unsafe(nil), comparison, major, minor, patch); end
end
