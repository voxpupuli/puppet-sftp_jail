require 'spec_helper'

describe 'sftp_jail::user' do
  let :pre_condition do
    'include ssh, sftp_jail'
  end
  let :title do
    'testuser'
  end
  let :params do
    {
      jail: '/chroot/testjail',
      sub_dirs: ['a', 'a/b']
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
      it 'creates sub directories' do
        is_expected.to contain_file('/chroot/testjail/home/testuser/a').with('ensure' => 'directory',
                                                                             'owner' => 'testuser',
                                                                             'group' => 'testuser',
                                                                             'mode' => '0755')
      end
      it 'creates nested sub directories' do
        is_expected.to contain_file('/chroot/testjail/home/testuser/a/b').with('ensure' => 'directory',
                                                                               'owner' => 'testuser',
                                                                               'group' => 'testuser',
                                                                               'mode' => '0755')
      end
    end
  end
end
