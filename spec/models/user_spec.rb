require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

  it "is valid if has all attributes" do
    @user = User.new(first_name: 'Louis', last_name: 'Rivest', email: 'loulou@gmail.com', password: 'loumoney', password_confirmation: 'loumoney')
    expect(@user.valid?).to be true
  end

  it "is not valid if first_name not present" do
    @user = User.new(last_name: 'Rivest', email: 'loulou@gmail.com', password: 'loumoney', password_confirmation: 'loumoney')
    expect(@user.valid?).to be false
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it "is not valid if last_name not present" do
    @user = User.new(first_name: 'Louis', email: 'loulou@gmail.com', password: 'loumoney', password_confirmation: 'loumoney')
    expect(@user.valid?).to be false
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it "is not valid if email not present" do
    @user = User.new(first_name: 'Louis', last_name: 'Rivest', password: 'loumoney', password_confirmation: 'loumoney')
    expect(@user.valid?).to be false
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "is not valid if email not unique" do
    @user = User.new(first_name: 'Louis', last_name: 'Rivest', email: 'loulou@gmail.com', password: 'loumoney', password_confirmation: 'loumoney')
    @user.save
    @user2 = User.new(first_name: 'Lola', last_name: 'Rivest', email: 'loulou@gmail.com', password: 'loumoney', password_confirmation: 'loumoney')
    expect(@user2.valid?).to be false
    puts @user2.errors.full_messages
    expect(@user2.errors.full_messages).to include("Email has already been taken")
  end

  it "is not valid if password not present" do
    @user = User.new(last_name: 'Rivest', email: 'loulou@gmail.com', password_confirmation: 'loumoney')
    expect(@user.valid?).to be false
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "is not valid if password confirmation not present" do
    @user = User.new(last_name: 'Rivest', email: 'loulou@gmail.com', password: 'loumoney')
    expect(@user.valid?).to be false
    expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
  end

  end

  describe '.authenticate_with_credentials' do
    it "is authenticated if enters right email-password" do
      @user = User.new(first_name: 'Louis', last_name: 'Rivest', email: 'loulou@gmail.com', password: 'loumoney', password_confirmation: 'loumoney')
      @user.save
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to be_truthy
    end

    it "is authenticated if enters right email-password" do
      @user = User.new(first_name: 'Louis', last_name: 'Rivest', email: 'loulou@gmail.com', password: 'loumoney', password_confirmation: 'loumoney')
      @user.save
      expect(User.authenticate_with_credentials('LouLou@gmail.com', @user.password)).to be_truthy
    end

    it "is authenticated if enters right email-password" do
      @user = User.new(first_name: 'Louis', last_name: 'Rivest', email: 'loulou@gmail.com', password: 'loumoney', password_confirmation: 'loumoney')
      @user.save
      expect(User.authenticate_with_credentials('  LouLou@gmail.com  ', @user.password)).to be_truthy
    end

  end
end


