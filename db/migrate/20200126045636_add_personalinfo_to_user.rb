# frozen_string_literal: true

class AddPersonalinfoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :website, :string
    add_column :users, :self_intro, :text
    add_column :users, :phone_number, :string
    add_column :users, :sex, :string
  end
end
