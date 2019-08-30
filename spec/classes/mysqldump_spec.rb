require 'spec_helper'

describe 'holland::mysqldump' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include ::holland' }

      it { is_expected.to compile }
      it { is_expected.to contain_class('holland::mysqldump::install') }
      it { is_expected.to contain_class('holland::mysqldump::config') }
    end
  end
end
