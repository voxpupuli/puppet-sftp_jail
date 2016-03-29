require 'spec_helper'

describe 'sftp_jail::single', :type => :define do
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
  describe "compiles" do
    let :title do
      'test'
    end
    let :params do
      {
        :jail_user  => 'bob',
        :jail_group => 'bob',
      }
    end
    it { is_expected.to compile }
    it { is_expected.to contain_class('sftp_jail') }
    it do
      is_expected.to contain_file('/chroot/test/').with({
        'ensure' => 'directory',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0755',
      })
      is_expected.to contain_file('/chroot/test/incoming').with({
        'ensure' => 'directory',
        'owner'  => 'bob',
        'group'  => 'bob',
        'mode'   => '0775',
     })
      is_expected.to contain_file('/chroot/test/home').with({
        'ensure' => 'directory',
        'owner'  => 'bob',
        'group'  => 'bob',
        'mode'   => '0775',
      })
      is_expected.to contain_file('/chroot/test/home/bob').with({
        'ensure' => 'directory',
        'owner'  => 'bob',
        'group'  => 'bob',
        'mode'   => '0775',
      })
      is_expected.to create_ssh__server__match_block('bob')
    end
  end
end
