class HimaDay < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :himad, :date
  end
end
