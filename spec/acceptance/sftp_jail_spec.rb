require 'spec_helper_acceptance'

describe 'basic sftp_jail' do
  it 'sets up the defaults' do
    pp = <<-EOS
    user { 'bob':
      ensure     => present,
      gid        => 'bob',
      managehome => true,
    }
    group { 'bob':
      ensure => present,
    }
    sftp_jail::single { 'testing':
      jail_user  => 'bob',
      jail_group => 'bob',
    }
    EOS
    apply_manifest(pp, :catch_failures => true)
  end
end
