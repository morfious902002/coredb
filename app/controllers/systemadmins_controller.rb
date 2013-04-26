class SystemadminsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :only_allow_admin, :only => [ :index, :edit, :destroy, :new, :create, :update ]
  
  # GET /systemadmins
  # GET /systemadmins.json
  def index
    @systemadmins = Systemadmin.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @systemadmins }
    end
  end

  # GET /systemadmins/1
  # GET /systemadmins/1.json
  def show
    @systemadmin = Systemadmin.find(params[:id])
    @pSAdmins    = Host.find_all_by_primary_sadmin_id(params[:id])
    @secSAdmins  = Host.find_all_by_secondary_sadmin_id(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @systemadmin }
    end
  end

  # GET /systemadmins/new
  # GET /systemadmins/new.json
  def new
    @systemadmin = Systemadmin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @systemadmin }
    end
  end

  # GET /systemadmins/1/edit
  def edit
    @systemadmin = Systemadmin.find(params[:id])
  end

  # POST /systemadmins
  # POST /systemadmins.json
  def create
    @systemadmin = Systemadmin.new(params[:systemadmin])

    respond_to do |format|
      if @systemadmin.save
        format.html { redirect_to @systemadmin, notice: 'Systemadmin was successfully created.' }
        format.json { render json: @systemadmin, status: :created, location: @systemadmin }
      else
        format.html { render action: "new" }
        format.json { render json: @systemadmin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /systemadmins/1
  # PUT /systemadmins/1.json
  def update
    @systemadmin = Systemadmin.find(params[:id])

    respond_to do |format|
      if @systemadmin.update_attributes(params[:systemadmin])
        format.html { redirect_to @systemadmin, notice: 'Systemadmin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @systemadmin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /systemadmins/1
  # DELETE /systemadmins/1.json
  def destroy
    @systemadmin = Systemadmin.find(params[:id])
    @systemadmin.destroy

    respond_to do |format|
      format.html { redirect_to systemadmins_url }
      format.json { head :no_content }
    end
  end

  private

  def only_allow_admin
    redirect_to root_path, :alert => 'Only Administrator have the permission.' unless current_user.has_role? :admin
  end
end
