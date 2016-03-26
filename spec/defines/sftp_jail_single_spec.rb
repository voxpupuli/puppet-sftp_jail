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
      'some_jail'
    end
    let :params do
      {
        :jail_user  => 'test',
        :jail_group => 'test',
      }
    end
    it { is_expected.to compile }
  end
end
