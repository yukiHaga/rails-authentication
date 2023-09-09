class RegistersController < ApplicationController
  before_action :check_loin, only: %i(new create)

  def new
  end

  def create
    user = User.new(create_params)
    # emailが一意であるかはバリデーションで確認。パスワードが正しいかもバリデーションで確認
    # パスワードとパスワードカンファが一致しているかはhas_secure_passwordを入れたので、モデルのバリデーション時におそらく確認してくれる
    # has_secure_passwordがあることで、パスワードのハッシュ化も勝手にやってくれる勝手にやってくれる
    # OKならセッションを確立して、リダイレクト
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      render :new
    end
  end

  private

  def create_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end