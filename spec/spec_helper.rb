require 'rspec'
require 'timecop'
require 'money-distributed'

RSpec.configure do |c|
  c.order = :random
  c.filter_run :focus
  c.run_all_when_everything_filtered = true

  c.after do
    Timecop.return
  end
end
