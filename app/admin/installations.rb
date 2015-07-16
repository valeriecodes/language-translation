ActiveAdmin.register Installation, as: 'Post' do
  permit_params :installation, :email, :contact

end