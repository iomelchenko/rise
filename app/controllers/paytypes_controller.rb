class PaytypesController < ApplicationController
  # GET /paytypes
  # GET /paytypes.json
  def index
    @paytypes = Paytype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paytypes }
    end
  end

  # GET /paytypes/1
  # GET /paytypes/1.json
  def show
    @paytype = Paytype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paytype }
    end
  end

  # GET /paytypes/new
  # GET /paytypes/new.json
  def new
    @paytype = Paytype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @paytype }
    end
  end

  # GET /paytypes/1/edit
  def edit
    @paytype = Paytype.find(params[:id])
  end

  # POST /paytypes
  # POST /paytypes.json
  def create
    @paytype = Paytype.new(params[:paytype])

    respond_to do |format|
      if @paytype.save
        format.html { redirect_to @paytype, notice: 'Paytype was successfully created.' }
        format.json { render json: @paytype, status: :created, location: @paytype }
      else
        format.html { render action: "new" }
        format.json { render json: @paytype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /paytypes/1
  # PUT /paytypes/1.json
  def update
    @paytype = Paytype.find(params[:id])

    respond_to do |format|
      if @paytype.update_attributes(params[:paytype])
        format.html { redirect_to @paytype, notice: 'Paytype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @paytype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paytypes/1
  # DELETE /paytypes/1.json
  def destroy
    @paytype = Paytype.find(params[:id])
    @paytype.destroy

    respond_to do |format|
      format.html { redirect_to paytypes_url }
      format.json { head :no_content }
    end
  end
end
