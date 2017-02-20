require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid and successfully saves with valid attributes' do
      @user = User.new(first_name: 'FirstName', last_name: 'LastName', email: 'test@example.com', password: 'secret', password_confirmation: 'secret')
      expect(@user.save).to be true
    end

    it 'is invalid without a password confirmation matching the password' do
      @user = User.new(first_name: 'FirstName', last_name: 'LastName', email: 'test@example.com', password: 'secret', password_confirmation: 'notTheSame')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is invalid without a unique email (not taking case sensitivity into account)' do
      @user1 = User.new(first_name: 'FirstName', last_name: 'LastName', email: 'unique@example.com', password: 'secret', password_confirmation: 'secret')
      @user2 = User.new(first_name: 'OtherFirstName', last_name: 'OtherLastName', email: 'UNIQUE@example.com', password: 'secret', password_confirmation: 'secret')

      @user1.save
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'is invalid without a first name' do
      @user = User.new(first_name: nil, last_name: 'LastName', email: 'test@example.com', password: 'secret', password_confirmation: 'secret')
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is invalid without a last name' do
      @user = User.new(first_name: 'FirstName', last_name: nil, email: 'test@example.com', password: 'secret', password_confirmation: 'secret')
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is invalid without an email' do
      @user = User.new(first_name: 'FirstName', last_name: 'LastName', email: nil, password: 'secret', password_confirmation: 'secret')
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is invalid without a password of minimum length 6' do
      @user = User.new(first_name: 'FirstName', last_name: 'LastName', email: 'test@example.com', password: 'bad', password_confirmation: 'bad')
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
