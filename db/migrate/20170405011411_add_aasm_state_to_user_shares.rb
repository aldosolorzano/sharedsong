class AddAasmStateToUserShares < ActiveRecord::Migration[5.0]
  def change
    add_column :user_shares, :aasm_state, :string
  end
end
