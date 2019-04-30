require 'rails_helper'

describe User do
  it_is_expected_to have_attributes(:email, :password)
end
