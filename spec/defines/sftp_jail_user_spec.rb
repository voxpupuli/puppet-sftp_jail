require 'spec_helper'

describe 'sftp_jail::user' do
  let :pre_condition do
    'include ssh'
  end
  let :title do
    'testuser'
  end
  let :params do
    {
      jail: '/chroot/testjail'
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      it { is_expected.to compile }
      it 'creates users homedir' do
        is_expected.to contain_file('/chroot/testjail/home/testuser').with('ensure' => 'directory',
                                                                           'owner' => 'testuser',
                                                                           'group' => 'testuser',
                                                                           'mode' => '0755')
      end
    end
  end
end
