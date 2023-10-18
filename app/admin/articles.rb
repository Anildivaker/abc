ActiveAdmin.register Article do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body, :image

  filter :title
  filter :body

  form do |f|
    f.inputs do 
      f.input :title
      f.input :body
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :title do |article|
      if article.title.present?
        article.title
      else
        "Title"
      end
    end
    column "article body", :body
    column "lal", :body do 
      "Placeholder"
    end
    column :created_at
    column :updated_at
    column :image do |article|
      if article.image.attached?
        image_tag article.image
      end
    end

   actions 
  end
  
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body]
  #   permitted
  # end

  # controller do 
  #   def update
  #     resource = 
  #   end
  # end
  
end
