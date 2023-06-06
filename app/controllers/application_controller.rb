class ApplicationController < ActionController::Base
  #devise利用の機能(ユーザ登録、ログイン認証など)が行われる前にconfigure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?
  #ログイン認証が成功していないと、トップページ以外の画面を表示させない
  before_action :authenticate_user!, except: [:top]
  
  #サインイン後の遷移先を設定
  #after_sign_in_path_forはdevise側のメソッド
  def after_sign_in_path_for(resource)
    books_path
  end 
  
  #サインアウト後の遷移先を設定
  def after_sign_out_path_for(resource)
    about_path
  end 
  
  #protectedは呼び出された他のコントローラからも参照可能
  protected
  
  #configure_permitted_parametersメソッドでは
  #devise_parameter_sanitizer.permitメソッドを使うことでデータの操作を行う
  #devise_parameter_sanitizer.permit(:deviseの処理名, keys: [:許可するキー])
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end 
end
