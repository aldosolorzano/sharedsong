class AddAasmStateToShares < ActiveRecord::Migration[5.0]
  def change
    add_column :shares, :aasm_state, :string
  end
end
