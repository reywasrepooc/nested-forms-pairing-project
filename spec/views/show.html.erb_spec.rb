describe 'doctors/show', type: :feature do
  before do
    Doctor.destroy_all
    Patient.destroy_all
    @doctor = Doctor.create!(name: 'Gillian')
    @honey = @doctor.patients.create!(name: 'Honey', age: 4)
    @zelda = @doctor.patients.create!(name: 'Zelda', age: 1)
  end

  it "renders the doctor's name" do
    visit doctor_path(@doctor)
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Gillian')
  end

  it "lists all of the doctor's patients" do
    visit doctor_path(@doctor)
    within('ul') do
      expect(page).to have_content('Honey')
      expect(page).to have_content('Zelda')
    end
  end
end