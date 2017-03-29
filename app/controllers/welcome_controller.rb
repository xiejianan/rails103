class WelcomeController < ApplicationController
  def index
    flash[:notice]="欢迎登入！"
    flash[:alert]="退出时间到了！"
    flash[:warning]="这是警告信息！"
  end
end
