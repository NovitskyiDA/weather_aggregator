ActiveAdmin.register User do
  scope :all, default: true
  scope('Unconfirmed') { |user| user.where(email_confirmed: false) }
  scope('Admins') { |user| user.where(admin: true) }

  index do
    id_column
    column :username
    column :email
    column :email_confirmed
    column :admin
    column :created_at
    column('locations') { |user| user.locations.length }
  end

  permit_params :username, :admin, :email_confirmed
end
