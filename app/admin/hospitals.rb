ActiveAdmin.register Hospital do
  controller do
    def permitted_params
      params.permit!
    end
  end


end
