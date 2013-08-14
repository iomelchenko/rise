# -*- encoding : utf-8 -*-
class SubcodeProdsController < ApplicationController
  # GET /subcode_prods
  # GET /subcode_prods.json
  def index
    @subcode_prods = SubcodeProd.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subcode_prods }
    end
  end

  # GET /subcode_prods/1
  # GET /subcode_prods/1.json
  def show
    @subcode_prod = SubcodeProd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subcode_prod }
    end
  end

  # GET /subcode_prods/new
  # GET /subcode_prods/new.json
  def new
    @subcode_prod = SubcodeProd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subcode_prod }
    end
  end

  # GET /subcode_prods/1/edit
  def edit
    @product = Product.find(params[:product_id])
    @subcode_prod = @product.subcode_prods.find(params[:id])
  end

  # POST /subcode_prods
  # POST /subcode_prods.json

  def create
    @product = Product.find(params[:product_id])
    @subcode_prod = @product.subcode_prods.create(params[:subcode_prod])
    redirect_to product_path(@product)
  end

  # PUT /subcode_prods/1
  # PUT /subcode_prods/1.json
  def update
    @product = Product.find(params[:product_id])
    @subcode_prod = SubcodeProd.find(params[:id])

    respond_to do |format|
      if @subcode_prod.update_attributes(params[:subcode_prod])
        format.html { redirect_to product_path(@product), notice: 'SubcodeProd was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subcode_prod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcode_prods/1
  # DELETE /subcode_prods/1.json

  def destroy
    @product = Product.find(params[:product_id])
    @subcode_prod = @product.subcode_prods.find(params[:id])
    @subcode_prod.destroy
    redirect_to product_path(@product)
  end  
end
