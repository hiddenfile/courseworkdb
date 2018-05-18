ActiveAdmin.register PatientCard do
  controller do
    def permitted_params
      params.permit!
    end
  end
  filter :hospital
  filter :polyclinic
  filter :employee
  filter :patient
  filter :start_at
  filter :end_at


end
