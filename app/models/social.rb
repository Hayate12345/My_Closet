class Social < ApplicationRecord
    # ! ユーザーテーブルとのアソシエーション
    belongs_to :user

    # ! SNSいいねテーブルとのアソシエーション
    has_many :social_likes

    # ! バリデーション
    validates :photograph, presence: true
    # ! photgraphカラムとアップローダを関連付ける
    mount_uploader :photograph, SnsImageUploader
end
