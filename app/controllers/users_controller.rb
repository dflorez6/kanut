class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :organizations_list

  def index
    if organization_signed_in?
      @users = User.where(organization_id: current_organization.id)
    else
      @users = User.all
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.name = update_full_name

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user.name = update_full_name

    # Update User without password (By doing it this way, there is no need to change Devise Controller for Registration)
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #==============
  # Custom Methods
  #==============
  def update_full_name
    params[:user][:first_name] + ' ' + params[:user][:last_name]
  end

  #==============
  # Private Methods
  #==============
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def organizations_list
    @organizations = Organization.all
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :first_name, :last_name, :email, :password, :password_confirmation, :organization_id)
  end
end
