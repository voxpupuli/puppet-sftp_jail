require 'spec_helper'

describe 'sftp_jail' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'with all defaults' do
        it { is_expected.to compile }

        it 'manages chroot folder' do
          is_expected.to contain_file('/chroot').with(
            'ensure' => 'directory',
            'owner' => 'root',
            'group' => 'root',
            'mode' => '0755'
          )
        end
      end
    end
  end
end
