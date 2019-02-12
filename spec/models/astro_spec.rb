require 'rails_helper'
require 'pry'

RSpec.describe Astro, type: :model do

  let(:valid_attrs) do
    {
      sign: "Aries",
      date_start: "3/21",
      date_end: "4/19",
      color: "Blue"
    }
  end

  let!(:astro) { Astro.create(valid_attrs) }
  let(:missing_attrs) { Astro.new(valid_attrs.except(:name, :color)) }
  let(:duplicate_name) { Astro.new(valid_attrs) }
  let(:duplicate_dates) { Astro.new(valid_attrs.merge(name: "Pices")) }

  let(:capricorn) { Astro.create(sign: "Capricorn", date_start: "12/22", date_end: "01/19", color: "Green") }

  it "is valid" do
    expect(astro).to be_valid
  end

  it "is invalid when missing attributes" do
    expect(missing_attrs).to be_invalid
  end

  it "requires a unique sign name" do
    expect(duplicate_name).to be_invalid
  end

  it "requires unique dates" do
    expect(duplicate_dates).to be_invalid
  end

  it "correctly determines date in range" do
    date = Date.parse('03/25')
    expect(astro.date_within?(date)).to be true
  end

  it "correctly determines date out of range" do
    date = Date.parse('04/22')
    expect(astro.date_within?(date)).to be false
  end

  it "correctly determines date at end of year" do
    date = Date.parse('12/23')
    expect(capricorn.date_within?(date)).to be true
  end

  it "correctly determines date at start of year" do
    date = Date.parse('01/01')
    expect(capricorn.date_within?(date)).to be true
  end
end
