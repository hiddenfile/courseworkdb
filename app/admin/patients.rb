ActiveAdmin.register Patient do
  controller do
    def permitted_params
      params.permit!
    end
  end

filter :id
end
