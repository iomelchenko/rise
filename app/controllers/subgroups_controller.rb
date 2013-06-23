class SubgroupsController < ApplicationController
  # GET /subgroups
  # GET /subgroups.json
  def index
    @subgroups = Subgroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subgroups }
    end
  end

  # GET /subgroups/1
  # GET /subgroups/1.json
  def show
    @subgroup = Subgroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subgroup }
    end
  end

  # GET /subgroups/new
  # GET /subgroups/new.json
  def new
    @subgroup = Subgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subgroup }
    end
  end

  # GET /subgroups/1/edit
  def edit
    @group = Group.find(params[:group_id])
    @subgroup = @group.subgroups.find(params[:id])
  end

  # POST /subgroups
  # POST /subgroups.json

  def create
    @group = Group.find(params[:group_id])
    @subgroup = @group.subgroups.create(params[:subgroup])
    redirect_to group_path(@group)
  end

  # PUT /subgroups/1
  # PUT /subgroups/1.json
  def update
    @group = Group.find(params[:group_id])
    @subgroup = Subgroup.find(params[:id])

    respond_to do |format|
      if @subgroup.update_attributes(params[:subgroup])
        format.html { redirect_to group_path(@group), notice: 'Subgroup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subgroups/1
  # DELETE /subgroups/1.json

  def destroy
    @group = Group.find(params[:group_id])
    @subgroup = @group.subgroups.find(params[:id])
    @subgroup.destroy
    redirect_to group_path(@group)
  end  
end
