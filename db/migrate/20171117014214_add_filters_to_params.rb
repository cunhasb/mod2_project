class AddFiltersToParams < ActiveRecord::Migration[5.1]
  def change
    add_column :params, :filters, :string
  end
end
