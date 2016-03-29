require 'spec_helper_acceptance'

describe 'basic sftp_jail' do
  it 'sets up the defaults' do
    pp = <<-EOS
    group { 'bob':
      ensure => 'present',
    } ->
    user { 'bob':
      ensure     => present,
      gid        => 'bob',
      managehome => true,
    } ->
    # Please don't judge me.
    file {'/home/bob/.ssh':
      ensure => 'directory',
      mode   => '0700',
      owner  => 'bob',
      group  => 'bob',
    } ->
    file {'/home/bob/.ssh/authorized_keys':
      ensure => 'present',
      mode   => '0700',
      owner  => 'bob',
      group  => 'bob',
    } ->
    exec {'stupid SSH key hack':
      command => 'rm -f /root/.ssh/id_rsa; ssh-keygen -t rsa -f /root/.ssh/id_rsa -N "" && chmod 0400 /root/.ssh/id_rsa && cat /root/.ssh/id_rsa.pub >> /home/bob/.ssh/authorized_keys',
      path    => '/bin:/usr/bin',
    } ->
    sftp_jail::jail { 'testing':
      write_user  => 'bob',
      jail_group => 'bob',
    }
    EOS
    apply_manifest(pp, :catch_failures => true)
  end

  it 'uploads file normally' do
    shell('(echo progress; echo "cd /incoming"; echo "put /etc/passwd"; echo quit)|sftp -o StrictHostKeyChecking=no -b - bob@localhost',
          :acceptable_exit_codes => 0)
  end
  describe file('/chroot/testing/incoming/passwd') do
    it { should be_file }
    it { should be_owned_by 'bob' }
  end
  describe file('/chroot/testing/incoming') do
    it { should be_directory }
  end

  it 'uploads file to invalid location' do
    shell('(echo progress; echo "cd /tmp"; echo "puet /etc/passwd"; echo quit)|sftp -o StrictHostKeyChecking=no -b - bob@localhost',
          :acceptable_exit_codes => 1)
  end

  describe file('/tmp/passwd') do
    it { should_not exist }
  end
end
