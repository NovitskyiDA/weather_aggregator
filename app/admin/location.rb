ActiveAdmin.register Location do
  actions :all, except: %i[create edit]

  index do
    id_column
    column :city
    column :country
    column :country_code
  end
end
