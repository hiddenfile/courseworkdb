ActiveAdmin.register Department do
  controller do
    def permitted_params
      params.permit!
    end
  end

end
