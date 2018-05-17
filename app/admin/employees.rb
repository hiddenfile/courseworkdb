ActiveAdmin.register Employee do
  menu :if => proc{current_employee.admin?}
  before_action :check_role, only: [:show, :edit, :update, :destroy]

  controller do
    def check_role
      if current_employee.id == params[:id].to_i || current_employee.admin?
        return
      else
        redirect_to '/'
      end
    end
  end


  filter :id
  filter :first_name
  filter :last_name
  filter :by_hospital, as: :select, collection: proc {Hospital.pluck(:name)}
  filter :by_polyclinic, as: :select, collection: proc {Polyclinic.pluck(:name)}
  filter :by_doctor_category, as: :select, collection: proc {Employee::SPECIALITY}
  filter :by_support_category, as: :select, collection: proc {Employee::SUPPORT}
  filter :by_city, as: :select, collection: proc {(Hospital.pluck(:city) + Polyclinic.pluck(:city)).uniq}
  filter :by_experience, as: :select, collection: proc {(1..50).map{|i|["#{i} years", i*1.0]}}
  filter :operations, as: :numeric
  filter :academic_degree, as: :select, collection: proc {Employee.pluck(:academic_degree).compact.uniq}
  filter :created_at
  filter :updated_at

  index do
     column :id
     column :first_name
     column :last_name
     column :academic_degree
     column :specialty
     column :level
     column '' do |obj|
       obj[:additional]
     end
    actions
  end


  controller do
    def permitted_params
      params.permit!
    end
  end

end
