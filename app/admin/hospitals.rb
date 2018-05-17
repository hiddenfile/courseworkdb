ActiveAdmin.register Hospital do
  menu :if => proc{ current_employee.admin? }

  controller do
    def permitted_params
      params.permit!
    end
  end


end
