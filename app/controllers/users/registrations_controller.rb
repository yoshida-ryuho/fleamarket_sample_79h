# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create,:new]
  # before_action :configure_account_update_params, only: [:update]
  def new
    @user = User.new
  end

  def create
    date = params[:birth_date]
    params[:user][:birth_date] = birth_date_join(date)

    #登録1ページ目から送られてきたパラメータを@userに代入
    @user = User.new(sign_up_params) 
    
    #validメソッドを使ってバリデーションチェック。これを書かないとモデルでかけたバリデーションが効かない
    unless @user.valid? 
      flash.now[:alert] = @user.errors.full_messages
      render :new and return #and returnを使って条件分岐を明示的に終了させている。
    end
    

   
    session["devise.regist_data"] = {user: @user.attributes} 
    #sessionにハッシュオブジェクトで情報保持させるため、attributesメソッドでデータ整形。

    session["devise.regist_data"][:user][:password] = params[:user][:password] 
    #前述で含まれなかった情報を代入。


    @destination = @user.build_destination 
    #build_destinationメソッドはhas_one :destinationのアソシエーションを設定すると使用可。関連づけのあるnewメソッドのようなもの。
    render :new_destination #登録2ページ目に遷移
  end

  
  
  def create_destination
    @user = User.new(session["devise.regist_data"]["user"])
    #session["devise.regist_data”]の中の["user”]というハッシュの情報を@userに代入している。

    @destination = Destination.new(destination_params)
    unless @destination.valid?
      flash.now[:alert] = @destination.errors.full_messages
      render :new_destination and return
    end
    @user.build_destination(@destination.attributes) #送られてきたparamsをbuild_ship_addressを用いて@userに代入
    @user.save
    session["devise.regist_data"]["user"].clear #sessionを明示的に削除 セキュリティ上必要
    sign_in(:user, @user) #登録後ログイン状態になるようにしている
    redirect_to root_path
    flash[:notice] = "新規会員登録が完了しました"
  end

  
  protected

  def birth_date_join(date)
    require "date"
    # date = params[:user][:birth_date]
    Date.new date["birth_date(1i)"].to_i,date["birth_date(2i)"].to_i,date["birth_date(3i)"].to_i
  end
   
  def destination_params
    params.require(:destination).permit(:destination_family_name, :destination_first_name, :destination_family_name_kana,:destination_first_name_kana, :post_code, :pref_id, :city, :house_number,:building_name,:phone_number)
  end
  # def new
  #   @user = User.new
  #   @user.build_destination
  # end

  # def create
  #   @user = User.new(user_params)
  #   @user.save
  #   # redirect_to root_path(@user)
  # end
  
  # private

  # def user_params
  #   params.require(:user).permit(:nickmame,profile_attributes:[],destination_attributes:[],:pref_id).merge(user_id: current_user.id)
  # end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  #   user = User.new(configure_sign_up_params)
  #   user.save
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name,:first_name,:family_name_kana,:first_name_kana,:birth_date,destination_attributes:[:id, :destination_family_name,:destination_first_name,:destination_family_name_kana,:destination_first_name_kana,:post_code,:pref,:city,:house_number,:building_name,:phone_number]])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
