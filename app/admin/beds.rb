ActiveAdmin.register Bed do
  controller do
    def permitted_params
      params.permit!
    end
  end

  filter :id
  filter :bed_number
  filter :hospital
  filter :block
  filter :department
  filter :ward
  filter :by_patient, as: :select, collection: proc{
    [["No Patients", 'none']] + (Patient.all.map{|p| [p.name, p.id]})
  }

end
