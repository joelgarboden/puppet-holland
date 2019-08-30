require 'spec_helper'

describe 'holland::mysqldump::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include ::holland::mysqldump' }

      it { is_expected.to compile }
      it {
        is_expected.to contain_file('/etc/holland/providers/mysqldump.conf')
          .with_ensure('file')
          .with_owner('root')
          .with_group('root')
          .with_mode('0640')
      }
    end
  end
end
