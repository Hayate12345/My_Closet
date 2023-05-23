class Answer < ApplicationRecord
     # ! userテーブルとのアソシエーション
    belongs_to :user
    # ! questionテーブルとのアソシエーション
    belongs_to :question

    # ! photgraphカラムとアップローダを関連付ける
    mount_uploader :photograph, AnswersImageUploader

    # ! バリデーション
    validates :answer, presence: true
end
