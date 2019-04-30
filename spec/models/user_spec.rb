require 'rails_helper'

describe User do
  subject(:subject) { described_class.new(email: 'foo.bar@email.com', password: '123123') }

  it { is_expected.to have_attributes(email: 'foo.bar@email.com') }
end
