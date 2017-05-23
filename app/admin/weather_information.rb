ActiveAdmin.register WeatherInformation do
  actions :index, :show

  index do
    id_column
    column :location
    column :updated_at
  end
end
