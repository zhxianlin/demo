class AddLogoToEvents < ActiveRecord::Migration[5.1]

  def change
    add_attachment :events, :logo

  end

end
