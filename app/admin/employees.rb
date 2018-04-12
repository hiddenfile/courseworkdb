ActiveAdmin.register Employee do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  academic_degree      :string
#  employee_category_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  operation_count      :integer
#  operation_fails      :integer

  filter :id
  filter :first_name
  filter :last_name
  filter :by_hospital, as: :select, collection: proc {Hospital.pluck(:name)}
  filter :by_polyclinic, as: :select, collection: proc {Polyclinic.pluck(:name)}
  filter :by_category, as: :select, collection: proc {EmployeeCategory.pluck(:kind).uniq}
  filter :academic_degree
  filter :operation_count
  filter :operation_fails
  filter :created_at
  filter :updated_at

  # filter :fake, as: :check_boxes, collection: [['Yes', true], ['No', false]]
  # filter :show_on_home, as: :check_boxes, collection: [['Yes', true], ['No', false]]
  # filter :presenter_user_email, as: :string, label: 'Presenter email'
  # filter :status, as: :select, collection: proc { Channel::Statuses::ALL }
  # filter :channel_type_description, as: :select, collection: proc { ChannelType.pluck(:description) }
  # filter :organization, as: :select, collection: proc { Organization.all }
  # filter :promo_start
  # filter :promo_end
  # filter :promo_weight


end
