class AddKanaLastNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :kana_last_name, :string
  end
end
