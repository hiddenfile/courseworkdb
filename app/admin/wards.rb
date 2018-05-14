ActiveAdmin.register Ward do
  controller do
    def permitted_params
      params.permit!
    end
  end

  scope(:full_empty)
end
