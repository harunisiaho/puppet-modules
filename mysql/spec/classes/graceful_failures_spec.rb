require 'spec_helper'

describe 'mysql::server' do
  context "on an unsupported OS" do
    let(:facts) do
      {
        :osfamily => 'UNSUPPORTED',
        :operatingsystem => 'UNSUPPORTED'
      }
    end
    it 'should gracefully fail' do
      is_expected.to compile.and_raise_error(/Unsupported platform:/)
    end
  end
end
