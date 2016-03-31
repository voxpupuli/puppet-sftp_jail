require 'spec_helper'

describe 'sftp_jail::user', :type => :define do
  let :pre_condition do
    'include ssh'
  end
  let :facts do
    {
      :osfamily               => 'Debian',
      :operatingsystem        => 'Debian',
      :operatingsystemrelease => '6',
      :lsbdistcodename        => 'squeeze',
      :id                     => 'root',
      :concat_basedir         => '/dne',
      :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      :kernel                 => 'Linux',
    }
  end
  let :title do
    'testuser'
  end
  let :params do
    {
      :jail => '/chroot/testjail',
    }
  end
  it { is_expected.to compile }
  it 'creates users homedir' do
    is_expected.to contain_file('/chroot/testjail/home/testuser').with({
      'ensure' => 'directory',
      'owner' => 'testuser',
      'group' => 'testuser',
      'mode' => '0755',
    })
  end
end
