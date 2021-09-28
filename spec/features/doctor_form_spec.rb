require 'rails_helper'
require 'capybara/rspec'

describe "the doctor form", :type => :feature do
  it "sets the name" do
    visit '/doctors/new'
    fill_in :doctor_name, with: 'Gillian'
    find('input[name="commit"]').click
    expect(Doctor.last.name).to eq 'Gillian'
  end

  it "adds patients" do
    visit '/doctors/new'
    fill_in :doctor_patients_attributes_0_name, with: 'Honey'
    fill_in :doctor_patients_attributes_0_age, with: 4
    fill_in :doctor_patients_attributes_1_name, with: 'Zelda'
    fill_in :doctor_patients_attributes_1_age, with: 1
    find('input[name="commit"]').click
    expect(Doctor.last.patients.map(&:name)).to eq ['Honey', 'Zelda']
    expect(Doctor.last.patients.map(&:age)).to eq [4, 1]
  end
end
