require 'spec_helper'

describe 'Sftp_jail::File_name' do
  %w[a B ! *(].each do |value|
    it { is_expected.to allow_value(value) }
  end

  [:undef, 1, '/', '/a' '/a/a', 'a/a', "\0"].each do |value|
    it { is_expected.not_to allow_value(value) }
  end
end
