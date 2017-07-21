class Business < ActiveRecord::Migration[5.1]
  def change
    enable_extension "pgcrypto"
    create_table :businesses, id: :uuid do |t|
      t.column :name, :string

      t.column :phone, :string
      t.column :email, :string
      t.column :twitter, :string
      t.column :facebook, :string
      t.column :website, :string

      t.column :owner, :string

      t.column :address1, :string
      t.column :address2, :string
      t.column :city, :string
      t.column :state, :string
      t.column :zip, :string

      t.timestamps
    end
    
  end
end
