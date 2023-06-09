class Profile::ProfilesController < ApplicationController
    # ! ログイン中のユーザを取得
    def show
        # * パラメータからユーザIDを取得
        @user = User.find(params[:id])

        # ログイン中のユーザが投稿したSNS投稿
        @snss = Social.where(user_id: @user.id).page(params[:page]).per(16)

        #ログイン中のユーザーがいいねしたSNS投稿
        @sns_likes = SocialLike.where(user_id: @user.id).page(params[:page]).per(16)

        #ログイン中のユーザーが投稿したクローゼット
        @closets = Closet.where(user_id:@user.id).page(params[:page]).per(16)

        # フォロー数
        @follow_list = UserRelation.where(follow_id: params[:id]).count

        # ファロワー数
        @follower_list = UserRelation.where(follower_id: params[:id]).count
    end

    # ! ユーザーのプロフィール更新メソッド
    def edit
        #　DBに保存されているユーザの登録情報抜き出す
        @user_data = User.find(params[:id])
        
        # * 編集権限がない場合はリダイレクト
        if @user_data.id != current_user.id
            redirect_to "/", alert: "不正なアクセスが行われました。"
        end
    end

    # ! データを更新
    def update
        @user_data = User.find(params[:id])

        # * 編集権限がない場合はリダイレクト
        if @user_data.id != current_user.id
            redirect_to "/", alert: "不正なアクセスが行われました。"
        end

        # ? 外部クラスをインスタンス化
        suggestions_controller = Suggestion::ApisController.new()

        if @user_data.update(posts_params)
            # * 初めての提案なのかそうでないのかを判定
            if Suggest.exists?(user_id: @user_data.id)
                
                # * 外部関数の呼び出し
                suggestions_controller.call_gpt_update(@user_data.id)
                redirect_to "/profile/show/#{@user_data.id}", notice: "プロフィールを編集しました"
            else
                # * 外部関数の呼び出し
                suggestions_controller.call_gpt(@user_data.id)
                redirect_to "/profile/show/#{@user_data.id}", notice: "プロフィールを編集しました"
            end

        else
            redirect_to"/", alert: "プロフィールの編集に失敗しました"
        end
    end

    private

    # ! 編集時にバインドするパラメータ
    def posts_params
        # * Userモデルにバインドする
        params.require(:user).permit(:avatar, :user_name, :height, :weight, :age, :gender, :profile)
    end

end
