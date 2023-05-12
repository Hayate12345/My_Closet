class Coordinates::PostsController < ApplicationController
    # ! 一覧表示メソッド
    def list
        # * Closetモデルを介して、全データを取得する
        @closets = Closet.all
    end
    
    # ! 登録フォーム用メソッド
    def new
        # * 使用するモデルを定義する
        @closet = Closet.new
    end

    # ! 登録処理用メソッド
    def create
        # * 投稿時にバインドするパラメータを付与する
        @closet = Closet.new(create_params)

        # * ログインしているユーザの情報を取得し、user_idのカラムにバインドする
        @closet.user_id = current_user.id

        # * 投稿が成功したら一覧表示ページへリダイレクト、投稿失敗時はエラーメッセージを表示する
        if @closet.save
            redirect_to "/closet/list"
        else
            render :new        
        end
    end

    # ! (privateは外部クラスから参照できない)
    private

    # ! 投稿時にバインドするパラメータ
    def create_params
        # * Closetモデルにバインドする
        params.require(:closet).permit(:photograph, :big_Category, :small_Category, :price, :color, :size, :brand)
    end
end
