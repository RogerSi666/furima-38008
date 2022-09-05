class AddKanaFirstNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :kana_first_name, :string
  end
end
