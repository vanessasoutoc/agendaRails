class ChangeColumnName < ActiveRecord::Migration
  def change
	  rename_column :atendimentos, :customer, :title
	  change_column :atendimentos, :date, :datetime
  end
end
