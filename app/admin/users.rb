ActiveAdmin.register Article do
	permit_params :name, :email, :mobile_number
end