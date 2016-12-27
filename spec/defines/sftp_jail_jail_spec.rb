require 'spec_helper'

describe 'sftp_jail::jail', type: :define do
  on_supported_os.each do |os, facts|
    context os # {os}" do
    let :facts do
      facts
    end
    let :pre_condition do
      'include ::ssh'
    end
    let :params do
      {
        user: 'bob',
        group: 'bob',
        match_group: 'sftpuser'
      }
    end
    let :title do
      'test'
    end
    it { is_expected.to compile }
    it { is_expected.to contain_class('sftp_jail') }
    it 'manages base folder' do
      is_expected.to contain_file('/chroot/test').with('ensure' => 'directory',
                                                       'owner'  => 'root',
                                                       'group'  => 'root',
                                                       'mode'   => '0755')
    end
    it 'manages an incoming directory' do
      is_expected.to contain_file('/chroot/test/incoming').with('ensure' => 'directory',
                                                                'owner'  => 'bob',
                                                                'group'  => 'bob',
                                                                'mode'   => '0755')
    end
    it 'manages a home directory' do
      is_expected.to contain_file('/chroot/test/home').with('ensure' => 'directory',
                                                            'owner'  => 'root',
                                                            'group'  => 'root',
                                                            'mode'   => '0755')
    end
    it 'manages a users home directory' do
      is_expected.to contain_file('/chroot/test/home/bob').with('ensure' => 'directory',
                                                                'owner'  => 'bob',
                                                                'group'  => 'bob',
                                                                'mode'   => '0755')
    end
    it 'adds an ssh server entry for the user' do
      is_expected.to contain_ssh__server__match_block('sftpuser').with('type' => 'Group',
                                                                       'options' => {
                                                                         'ChrootDirectory' => '/chroot/test',
                                                                         'ForceCommand'           => 'internal-sftp',
                                                                         'PasswordAuthentication' => 'no',
                                                                         'AllowTcpForwarding'     => 'no',
                                                                         'X11Forwarding'          => 'no'
                                                                       })
    end
  end
end
