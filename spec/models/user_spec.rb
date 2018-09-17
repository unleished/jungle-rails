require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = User.new
    @user.first_name = "Leisha"
    @user.last_name = "Leisha"
    @user.email = "leisha@leisha.com"
    @user.password = "Leisha"
    @user.password_confirmation = "Leisha"
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
  end

  it "is invalid with mismatched password" do
    @user.password_confirmation = "Leisha2"
    expect(@user).to be_invalid
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "is invalid with a duplicate email" do
    @user.save

    @user2 = User.new
    @user2.first_name = "Leisha"
    @user2.last_name = "Leisha"
    @user2.email = "Leisha@leisha.com"
    @user2.password = "Leisha"
    @user2.password_confirmation = "Leisha"
    @user2.password_confirmation = "Leisha"
    expect(@user2).to be_invalid
    expect(@user2.errors.full_messages).to include("Email has already been taken")
  end

  it "is invalid with a duplicate email in caps" do
    @user.save
    @user3 = User.new
    @user3.first_name = "Leisha"
    @user3.last_name = "Leisha"
    @user3.email = "LEISHA@leisha.com"
    @user3.password = "Leisha"
    @user3.password_confirmation = "Leisha"
    @user3.password_confirmation = "Leisha"
    expect(@user3).to be_invalid
    expect(@user3.errors.full_messages).to include("Email has already been taken")
  end

  it "password is 6 or more characters" do

    expect(@user).to be_valid
  end

  it "password is 5 characters" do
    @user.password = 'lamb'
    expect(@user).to be_invalid
  end

end
