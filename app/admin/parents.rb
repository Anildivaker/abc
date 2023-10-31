ActiveAdmin.register Parent do
  permit_params :name, children_attributes: [:id, :name, :age, :_destroy]

  form do |f|
    f.inputs "Parent Details" do
      f.input :name
    end

    f.has_many :children, allow_destroy: true do |child_f|
      child_f.input :name
      child_f.input :age
    end

    f.actions
  end
  show do
    # debugger
    attributes_table do
      row :id
      row :name
      panel "Children" do
        table_for parent.children do
          column :name
          column :age
        end
      end
    end
  end
end
