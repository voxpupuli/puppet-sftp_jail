# frozen_string_literal: true

require 'spec_helper'

describe 'Sftp_jail::Sub_dirs' do
  values = %w[a a/a a/a/ !/@/#/$]
  it { is_expected.to allow_value(values) }

  [:undef, 1, "\0", '/a'].each do |value|
    it { is_expected.not_to allow_value([value]) }
  end
end
