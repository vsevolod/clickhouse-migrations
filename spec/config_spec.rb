require_relative 'rails_helper'

describe Clickhouse::Rails::Config do
  describe '.init' do
    subject(:init) { described_class.init }

    context 'when config file does not exists' do
      let(:error_class) { Clickhouse::Rails::Config::ConfigurationNotFound }
      it { expect { init }.to raise_error(error_class) }
    end

    context 'when config file exists' do
      let(:path) { File.dirname(__FILE__) + '/fixtures/files/clickhouse.yml' }

      before do
        stub_const('Clickhouse::Rails::Config::DEFAULT_CONFIG_PATH', path)
      end

      it { expect { init }.not_to raise_error }
    end
  end
end
