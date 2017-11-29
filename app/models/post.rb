class Post < ApplicationRecord
  # 必須チェック(presence)と文字数(length)チェック及びエラーメッセージの設定
  validates :title, presence: true, length:{ minimum: 3, message: 'Too short to post!!' }
  validates :body, presence: true
end
