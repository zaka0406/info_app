class InfosController < ApplicationController
    before_action :edit_info, only: [:edit,:show]
    before_action :return_index, except: [:index,:show]

    def index
        # 表示させるため@付与、たくさん投稿されるので複数形で設定
        # N+1問題によりall⇒includesへ変更
        # orderを使用して新規投稿が上に来るように並び替え
        @infos = Info.includes(:user).order(created_at: "DESC")
    end

    def new
        @info = Info.new
    end

    def create
        Info.create(info_params)
        redirect_to("/")
        flash[:notice] = "投稿されました"
    end
    
    def edit
        # edit_infoで共通コードとしてまとめbefore_actionで先に実行されるように指定したのでコメントアウト
        # @info = Info.find(params[:id])
    end
    
    def update
        info = Info.find(params[:id])
        info.update(info_params)
        redirect_to("/users/#{current_user.id}")
        flash[:notice] = "更新が完了しました。"
    end
    
    def show
        # edit同様
        # @info = Info.find(params[:id])
    end


    def destroy
        info = Info.find(params[:id])
        info.destroy
        redirect_to("/users/#{current_user.id}")
        flash[:notice]="投稿を削除しました"
    end
    
    # 安全なデータなのか確認するためにストロングパラメーターとして設定
    # mergeを用いて投稿者とログインしている人を紐づける
    private
        def info_params
            params.require(:info).permit(:image, :text).merge(user_id: current_user.id)
        end
    
        def edit_info
            @info = Info.find(params[:id])
        end

    def return_index
        unless  user_signed_in?
            redirect_to action: :index
            
        end
    end
end
