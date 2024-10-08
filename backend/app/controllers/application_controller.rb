class ApplicationController < ActionController::API
  before_action :authenticate_user

  private

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last

    if token
      begin
        # トークンをデコードする際に有効期限(exp)も検証
        decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' })[0]

        # `exp` クレームを確認し、トークンが期限切れでないかをチェック
        exp = decoded_token['exp']
        if exp && Time.at(exp) < Time.now
          render json: { error: 'Token has expired' }, status: :unauthorized
          return
        end

        # 有効期限が切れていなければ、ユーザーIDからユーザーを取得
        user_id = decoded_token['user_id']
        @current_user = User.find(user_id) if user_id

      rescue JWT::ExpiredSignature
        # トークンの有効期限が切れていた場合のエラー処理
        render json: { error: 'Token has expired' }, status: :unauthorized
      rescue JWT::DecodeError
        # トークンが無効またはデコードに失敗した場合のエラー処理
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    else
      render json: { error: 'No token provided' }, status: :unauthorized
    end
  end

    # 現在のユーザーを返すヘルパーメソッド
    def current_user
      @current_user
    end

    # ユーザーがログイン中かどうかを判定
    def logged_in?
      !!current_user
    end
end

