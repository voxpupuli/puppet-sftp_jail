require 'spec_helper_acceptance'

describe 'basic and shared SFTP jails' do
  it 'sets up the defaults' do
    pp = <<-EOS
      class {'ssh': } ->
      group { ['alice','bob','carol','dave','shared1']:
        ensure => 'present',
      } ->
      # Single-user jail accounts
      user { ['alice','bob']:
        ensure     => present,
        managehome => true,
      } ->
      # Single-user jail accounts without managehome
      user { 'matz':
        ensure     => present,
        managehome => false,
      } ->
      # Shared jail users
      user { 'carol':
        ensure     => 'present',
        managehome => true,
        gid        => 'shared1',
        groups     => ['carol'],
      } ->
      user { 'dave':
        ensure     => 'present',
        managehome => 'true',
        gid        => 'shared1',
        groups     => ['dave'],
      } ->
      file {'/root/.ssh/id_rsa':
        ensure => 'present',
        owner  => 'root',
        group  => 'root',
        mode   => '0400',
        content => '-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzI
w+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoP
kcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2
hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NO
Td0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcW
yLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQIBIwKCAQEA4iqWPJXtzZA68mKd
ELs4jJsdyky+ewdZeNds5tjcnHU5zUYE25K+ffJED9qUWICcLZDc81TGWjHyAqD1
Bw7XpgUwFgeUJwUlzQurAv+/ySnxiwuaGJfhFM1CaQHzfXphgVml+fZUvnJUTvzf
TK2Lg6EdbUE9TarUlBf/xPfuEhMSlIE5keb/Zz3/LUlRg8yDqz5w+QWVJ4utnKnK
iqwZN0mwpwU7YSyJhlT4YV1F3n4YjLswM5wJs2oqm0jssQu/BT0tyEXNDYBLEF4A
sClaWuSJ2kjq7KhrrYXzagqhnSei9ODYFShJu8UWVec3Ihb5ZXlzO6vdNQ1J9Xsf
4m+2ywKBgQD6qFxx/Rv9CNN96l/4rb14HKirC2o/orApiHmHDsURs5rUKDx0f9iP
cXN7S1uePXuJRK/5hsubaOCx3Owd2u9gD6Oq0CsMkE4CUSiJcYrMANtx54cGH7Rk
EjFZxK8xAv1ldELEyxrFqkbE4BKd8QOt414qjvTGyAK+OLD3M2QdCQKBgQDtx8pN
CAxR7yhHbIWT1AH66+XWN8bXq7l3RO/ukeaci98JfkbkxURZhtxV/HHuvUhnPLdX
3TwygPBYZFNo4pzVEhzWoTtnEtrFueKxyc3+LjZpuo+mBlQ6ORtfgkr9gBVphXZG
YEzkCD3lVdl8L4cw9BVpKrJCs1c5taGjDgdInQKBgHm/fVvv96bJxc9x1tffXAcj
3OVdUN0UgXNCSaf/3A/phbeBQe9xS+3mpc4r6qvx+iy69mNBeNZ0xOitIjpjBo2+
dBEjSBwLk5q5tJqHmy/jKMJL4n9ROlx93XS+njxgibTvU6Fp9w+NOFD/HvxB3Tcz
6+jJF85D5BNAG3DBMKBjAoGBAOAxZvgsKN+JuENXsST7F89Tck2iTcQIT8g5rwWC
P9Vt74yboe2kDT531w8+egz7nAmRBKNM751U/95P9t88EDacDI/Z2OwnuFQHCPDF
llYOUI+SpLJ6/vURRbHSnnn8a/XG+nzedGH5JGqEJNQsz+xT2axM0/W/CRknmGaJ
kda/AoGANWrLCz708y7VYgAtW2Uf1DPOIYMdvo6fxIB5i9ZfISgcJ/bbCUkFrhoH
+vq/5CIWxCPp0f85R4qxxQ5ihxJ0YDQT9Jpx4TMss4PSavPaBH3RXow5Ohe+bYoQ
NE5OgEXk2wVfZczCZpigBKbKZHNYcelXtTt/nP3rsCuGcM4h53s=
-----END RSA PRIVATE KEY-----',
    } ->
      ssh_authorized_key {'root@alice':
        user => 'alice',
        type => 'ssh-rsa',
        key  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==',
      } ->
      ssh_authorized_key {'root@bob':
        user => 'bob',
        type => 'ssh-rsa',
        key  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==',
      } ->
      ssh_authorized_key {'root@matz':
        user => 'matz',
        type => 'ssh-rsa',
        key  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==',
      } ->
      ssh_authorized_key {'root@carol':
        user => 'carol',
        type => 'ssh-rsa',
        key  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==',
      } ->
      ssh_authorized_key {'root@dave':
        user => 'dave',
        type => 'ssh-rsa',
        key  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==',
      } ->
      sftp_jail::jail { 'test1':
        user   => 'alice',
        group  => 'alice',
      } ->
      sftp_jail::jail { 'test2':
        user  => 'bob',
        group => 'bob',
      } ->
      sftp_jail::jail { 'test3':
        user  => 'matz',
        group => 'matz',
      } ->
      sftp_jail::jail { 'shared1':
        user  => 'carol',
        group => 'carol',
        match_group => 'shared1',
      } ->
      sftp_jail::user { 'dave':
         jail  => '/chroot/shared1',
         group => 'dave'
       }
    EOS
    apply_manifest(pp, catch_failures: true)
  end

  describe file('/chroot/test1') do
    it { is_expected.to be_directory }
    it { is_expected.to be_owned_by 'root' }
  end
  describe file('/chroot/test1/incoming') do
    it { is_expected.to be_directory }
    it { is_expected.to be_owned_by 'alice' }
  end
  describe file('/chroot/test1/home') do
    it { is_expected.to be_directory }
    it { is_expected.to be_owned_by 'root' }
  end
  describe file('/chroot/test1/home/alice') do
    it { is_expected.to be_directory }
    it { is_expected.to be_owned_by 'alice' }
  end
  describe file('/chroot/test3/home/matz') do
    it { is_expected.to be_directory }
    it { is_expected.to be_owned_by 'matz' }
  end

  it 'performs normal file upload to single user jail' do
    shell('(echo progress; echo "cd /incoming"; echo "put /etc/passwd"; echo quit)|sftp -o StrictHostKeyChecking=no -b - alice@localhost',
          acceptable_exit_codes: 0)
  end
  describe file('/chroot/test1/incoming/passwd') do
    it { is_expected.to be_file }
    it { is_expected.to be_owned_by 'alice' }
  end

  it 'uploads file to second single jail' do
    shell('(echo progress; echo "cd /incoming"; echo "put /etc/passwd"; echo quit)|sftp -o StrictHostKeyChecking=no -b - bob@localhost',
          acceptable_exit_codes: 0)
  end
  describe file('/chroot/test2/incoming/passwd') do
    it { is_expected.to be_file }
    it { is_expected.to be_owned_by 'bob' }
  end

  it 'performs normal file upload to single user jail without managehome' do
    shell('(echo progress; echo "cd /incoming"; echo "put /etc/passwd"; echo quit)|sftp -o StrictHostKeyChecking=no -b - matz@localhost',
          acceptable_exit_codes: 0)
  end
  describe file('/chroot/test3/incoming/passwd') do
    it { is_expected.to be_file }
    it { is_expected.to be_owned_by 'matz' }
  end

  it 'uploads file to invalid location' do
    shell('(echo progress; echo "cd /tmp"; echo "put /etc/passwd"; echo quit)|sftp -o StrictHostKeyChecking=no -b - bob@localhost',
          acceptable_exit_codes: 1)
  end
  describe file('/tmp/passwd') do
    it { is_expected.not_to exist }
  end

  it 'uploads file to first shared jail' do
    shell('(echo progress; echo "cd /incoming"; echo "put /etc/passwd"; echo quit)|sftp -o StrictHostKeyChecking=no -b - carol@localhost',
          acceptable_exit_codes: 0)
  end
  describe file('/chroot/shared1/incoming/passwd') do
    it { is_expected.to be_file }
    it { is_expected.to be_owned_by 'carol' }
  end

  it 'pulls file from first shared jail as write user' do
    shell('(echo progress; echo "cd /incoming"; echo "get passwd"; echo quit)|sftp -o StrictHostKeyChecking=no -b - carol@localhost',
          acceptable_exit_codes: 0)
  end
  it 'pulls file from first shared jail as read user' do
    shell('(echo progress; echo "cd /incoming"; echo "get passwd"; echo quit)|sftp -o StrictHostKeyChecking=no -b - dave@localhost',
          acceptable_exit_codes: 0)
  end
  it 'attempts to delete file without group write permission' do
    shell('su -  dave -c "rm -f /chroot/shared1/incoming/passwd"',
          acceptable_exit_codes: 1)
  end

  it 'attempts to escape shared jail as write user' do
    shell('(echo progress; echo "cd /tmp"; echo "put /etc/passwd"; echo quit)|sftp -o StrictHostKeyChecking=no -b - carol@localhost',
          acceptable_exit_codes: 1)
  end
  it 'attempts to esacape shared jail as read-only user' do
    shell('(echo progress; echo "cd /tmp"; echo "put /etc/passwd"; echo quit)|sftp -o StrictHostKeyChecking=no -b - dave@localhost',
          acceptable_exit_codes: 1)
  end
  describe file('/tmp/passwd') do
    it { is_expected.not_to exist }
  end
end
