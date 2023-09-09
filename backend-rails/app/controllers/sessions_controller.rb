class SessionsController < ApplicationController
  before_action :check_loin, only: %i(new create)

  def new
  end

  # emailでユーザーを特定
  # その後Loginメソッド(paswordとダイジェストが一致しているかを確認)内で比較する。OKならクッキーを返す。そして mypageにリダイレクトする
  # ログインに失敗したなら、ログインフォームをレンダーする
  def create
    user = User.find_by(email: params[:email])

    # 認証後にセッション管理をする
    if user && user.authenticate(params[:password])
      redirect_to mypage_path
      session[:user_id] = user.id
    else
      render :new
    end
  end

  def destroy
    # reset_sessionメソッドは、セッション内のデータをクリアし、新しいセッションIDを生成します。これにより、以前のセッションデータは無効になります。
    reset_session
    head :ok
  end
end