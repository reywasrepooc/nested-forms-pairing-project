class Doctor < ActiveRecord::Base
  has_many :patients
  accepts_nested_attributes_for :patients

  def patients_attributes=(patients_attributes)
    patients_attributes.values.each do |pat|
      patient = Patient.find_or_create_by(name: pat[:name], age: pat[:age])
      patients << patient
    end
  end
end
