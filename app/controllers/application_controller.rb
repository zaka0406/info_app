class ApplicationController < ActionController::Base
    # もしdiviseに関するコントローラーの場合は、先にonfigure_permitted_parametersのストロングパラメータを実行する
    before_action :configure_permitted_parameters, if: :devise_controller?

    # 本当に安全なデータであるかを確認（ストロングパラメーター）で設定
    private 
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
    end
end
