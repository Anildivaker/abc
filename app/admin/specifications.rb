ActiveAdmin.register Specification do
  permit_params :context_type, :context_text, :context_array

  form do |f|
    f.inputs do
      f.input :context_type, as: :select, collection: Specification.context_types.keys
      f.input :context_text
      f.input :context_array
    end
    f.actions
  end
end

