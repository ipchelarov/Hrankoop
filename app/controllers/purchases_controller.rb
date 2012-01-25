class PurchasesController < ApplicationController
  # GET /purchases
  # GET /purchases.xml
  def index
    @purchases = Purchase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchases }
    end
  end

  # GET /purchases/1
  # GET /purchases/1.xml
  def show
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase }
    end
  end

  # GET /purchases/new
  # GET /purchases/new.xml
  def new
    @purchase = Purchase.new
    if (params[:offer])
      @offer = Offer.find(params[:offer])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase }
    end
  end

  # GET /purchases/1/edit
  def edit
    @purchase = Purchase.find(params[:id])
    @offer = @purchase.offer
  end

  # POST /purchases
  # POST /purchases.xml
  def create
    buyer = Person.find(params[:purchase][:person_id])
    offer = Offer.find(params[:purchase][:offer_id])
    product = Product.find(params[:purchase][:product_id])
    params[:purchase][:buyer] = buyer
    params[:purchase][:offer] = offer
    params[:purchase][:product] = product
    @purchase = Purchase.new(params[:purchase])

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to(@purchase, :notice => 'Purchase was successfully created.') }
        format.xml  { render :xml => @purchase, :status => :created, :location => @purchase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchases/1
  # PUT /purchases/1.xml
  def update
    @purchase = Purchase.find(params[:id])
    buyer = Person.find(params[:purchase][:person_id])
    offer = Offer.find(params[:purchase][:offer_id])
    product = Product.find(params[:purchase][:product_id])
    params[:purchase][:buyer] = buyer
    params[:purchase][:offer] = offer
    params[:purchase][:product] = product

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to(@purchase, :notice => 'Purchase was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end

  def order_product
    @product = Product.find(params[:id])
    @offers = @product.offers
    unless (@offers.empty?)
      @purchase = Purchase.new
      @purchase.offer = @offers[0]
      @purchase.product = @product
      respond_to do |format|
        format.html { render :new }
        format.xml  { render :xml => @purchase }
      end
    else
      redirect_to(products_path, :notice => "Currently the product #{@product.name} has no offering.")
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.xml
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to(purchases_url) }
      format.xml  { head :ok }
    end
  end
end
