require 'spec_helper'

describe Money::Distributed::Fetcher::File do
  let(:file_path) { File.expand_path('../../fixtures/rates.json', __FILE__) }
  let(:bank) { double(add_rate: true) }

  subject { described_class.new(file_path, bank) }

  it 'fetches rates from the file' do
    subject.fetch

    expect(bank).to have_received(:add_rate).with('USD', 'USD', 1.0)
    expect(bank).to have_received(:add_rate).with('AUD', 'AUD', 1.0)
    expect(bank).to have_received(:add_rate).with('EUR', 'EUR', 1.0)
    expect(bank).to have_received(:add_rate).with('USD', 'AUD', 1.3209)
    expect(bank).to have_received(:add_rate).with('AUD', 'USD', 0.7571)
    expect(bank).to have_received(:add_rate).with('USD', 'EUR', 0.9076)
    expect(bank).to have_received(:add_rate).with('EUR', 'USD', 1.1018)
    expect(bank).to have_received(:add_rate).with('AUD', 'EUR', 0.6871)
    expect(bank).to have_received(:add_rate).with('EUR', 'AUD', 1.4554)
  end
end
