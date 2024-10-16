class TopController < ApplicationController
    def main
        if session[:login_uid]
            render "main"
        else
            render "login"
        end
    end
    
    def login
        #if params[:uid] == 'kindai' and params[:pass] == 'sanriko'
        user = User.find_by(uid: params[:uid])
        if user and BCrypt::Password.new(user.pass) == params[:pass]
            logger.debug "-" * 50
            logger.debug user
            session[:login_uid] = params[:uid]
            redirect_to top_main_path
        else
            render "error", status: 422
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
    
end
