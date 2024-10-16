require 'bcrypt'

#ユーザ登録のアクション
signup_password = BCrypt::Password.create("my password")

puts signup_password

#ログインのアクション
if User.find_by(uid: params[:uid])
    login_password = BCrypt::Password.new(signup_password)
    if login_password == “my password”
        p "ログイン成功"
    end
end