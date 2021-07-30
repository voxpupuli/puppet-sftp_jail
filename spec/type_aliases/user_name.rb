require 'spec_helper'

describe 'Sftp_jail::User_name' do
  %w[a A aa AA _a a.1_-$].each do |value|
    it { is_expected.to allow_value(value) }
  end

  [:undef, 1, '1a', '.a', '-a', '$a', '[a', '#a'].each do |value|
    it { is_expected.not_to allow_value(value) }
  end
end
