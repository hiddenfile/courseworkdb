ActiveAdmin.register Employee do
  filter :id
  filter :first_name
  filter :last_name
  filter :by_hospital, as: :select, collection: proc {Hospital.pluck(:name)}
  filter :by_polyclinic, as: :select, collection: proc {Polyclinic.pluck(:name)}
  filter :by_doctor_category, as: :select, collection: proc {Employee::SPECIALITY}
  filter :by_support_category, as: :select, collection: proc {Employee::SUPPORT}
  filter :by_city, as: :select, collection: proc {(Hospital.pluck(:city) + Polyclinic.pluck(:city)).uniq}
  filter :academic_degree
  filter :count_operations
  filter :operation_fails
  filter :created_at
  filter :updated_at
  controller do
    def permitted_params
      params.permit!
    end
  end

end
