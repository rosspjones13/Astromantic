require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do

  let(:valid_attrs) do
    {
      name: "John Doe",
      email: "john@doe.com",
      username: "john_doe",
      birthday: DateTime.parse('1980/01/01'),
      password: "password"
    }
  end

  let!(:user) { User.create(valid_attrs) }
  let(:missing_attrs) { User.new(valid_attrs.except(:name, :email)) }
  let(:invalid_email) { User.new(valid_attrs.merge(email: "bad")) }
  let(:invalid_username) { User.new(valid_attrs.merge(username: "bad username")) }
  let(:duplicate_email) { User.new(valid_attrs.merge(username: "john_doe2")) }
  let(:duplicate_username) { User.new(valid_attrs.merge(email: "john@doe.net")) }
  let(:underage) { User.new(valid_attrs.merge(birthday: DateTime.now)) }

  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid when missing attributes" do
    expect(missing_attrs).to be_invalid
  end

  it "requires a valid(ish) email" do
    expect(invalid_email).to be_invalid
  end

  it "requires a unique email" do
    expect(duplicate_email).to be_invalid
  end

  it "requires a valid username" do
    expect(invalid_username).to be_invalid
  end

  it "requires a unique username" do
    expect(duplicate_username).to be_invalid
  end

  it "requires legal age" do
    expect(underage).to be_invalid
  end

  it "finds correct astrological sign" do
    Astro.create(sign: "Capricorn", date_start: "12/22", date_end: "01/19", color: "Green")
    expect(user.find_astrological_sign.sign).to eq("Capricorn")
  end
end
