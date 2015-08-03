ActiveAdmin.register Site do
  permit_params :name, :installation_id

  form do |f|
    f.inputs "New Site" do
      f.input :installation, label: 'Post'
      f.input :name
    end
    f.actions
  end

end
