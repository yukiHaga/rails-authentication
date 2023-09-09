class ApplicationController < ActionController::Base
  # ミドルウェア的な処理は親コントローラに書いてbefore_actionするのがよくあるパターンかもね
  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end

  # current_userの存在を確認することで、session_idのチェックとsession_idを満たすユーザーをチェックしている
  def logged_in?
    return current_user.present?
  end

  # セッションストレージからuser_idを取得している(goならここでsession_idがなかったらエラーが発生する)
  # sesison_idを満たすユーザーを取得している
  def current_user
    return User.find_by(id: session[:user_id])
  end

  # 既にログインしているなら、マイページにリダイレクトさせる
  def check_loin
    if logged_in?
      redirect_to mypage_path
    end
  end
end
