class DbadminsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :only_allow_admin, :only => [ :index, :edit, :destroy, :new, :create, :update ]
  
  # GET /dbadmins
  # GET /dbadmins.json
  def index
    @dbadmins = Dbadmin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dbadmins }
    end
  end

  # GET /dbadmins/1
  # GET /dbadmins/1.json
  def show
    @dbadmin = Dbadmin.find(params[:id])
    # pridatabase
    @primaryAdmins   = Database.find_all_by_primary_dba_id(params[:id])
    @secondaryAdmins = Database.find_all_by_secondary_dba_id(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dbadmin}
    end
  end

  # def pridatabase
  #   @primaryAdmins   = Database.find_all_by_primary_dba_id(params[:id])
  # end

  # GET /dbadmins/new
  # GET /dbadmins/new.json
  def new
    @dbadmin = Dbadmin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dbadmin }
    end
  end

  # GET /dbadmins/1/edit
  def edit
    @dbadmin = Dbadmin.find(params[:id])
  end

  # POST /dbadmins
  # POST /dbadmins.json
  def create
    @dbadmin = Dbadmin.new(params[:dbadmin])

    respond_to do |format|
      if @dbadmin.save
        format.html { redirect_to @dbadmin, notice: 'Dbadmin was successfully created.' }
        format.json { render json: @dbadmin, status: :created, location: @dbadmin }
      else
        format.html { render action: "new" }
        format.json { render json: @dbadmin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dbadmins/1
  # PUT /dbadmins/1.json
  def update
    @dbadmin = Dbadmin.find(params[:id])

    respond_to do |format|
      if @dbadmin.update_attributes(params[:dbadmin])
        format.html { redirect_to @dbadmin, notice: 'Dbadmin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dbadmin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dbadmins/1
  # DELETE /dbadmins/1.json
  def destroy
    @dbadmin = Dbadmin.find(params[:id])
    @dbadmin.destroy

    respond_to do |format|
      format.html { redirect_to dbadmins_url }
      format.json { head :no_content }
    end
  end

  private

  def only_allow_admin
    redirect_to root_path, :alert => 'Only Administrator have the permission.' unless current_user.has_role? :admin
  end
end
