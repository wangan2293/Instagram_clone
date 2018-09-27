class RenameCommentIdColumnToBody < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :comment_id, :body
  end
end
