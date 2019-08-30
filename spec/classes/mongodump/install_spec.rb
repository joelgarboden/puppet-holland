require 'spec_helper'

describe 'holland::mongodump::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include ::holland::mongodump' }

      it { is_expected.to compile }
      it { is_expected.to contain_package('holland-mongodump').with_ensure('present') }
    end
  end
end
