class ProductsController < ApplicationController
def index
@products=Product.all
end

def edit
@product=Product.find(params[:id])
end

def show
@product=Product.find(params[:id])
end

def update
@product=Product.find(params[:id])
if @product.update(product_params)
redirect_to products_path, message:"updated"
else
render action:"new"
end
end

def create
@product= Product.new(product_params)
if @product.save
redirect_to products_path, message:"created"
else
render action:"new"
end
end

def new
@product=Product.new
end

def destroy
@product=Product.find(params[:id])
@product.destroy
redirect_to products_path, message:"deleted"
end

private

def product_params
params.require(:product).permit(:name,:image)
end
end
