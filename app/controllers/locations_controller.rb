class LocationsController < ApplicationController
def index
@locations=Location.all
end
def edit
@location=Location.find(params[:id])
end

def show
@location=Location.find(params[:id])
end

def update
@location=Location.find(params[:id])
if @location.update(location_params)
redirect_to locations_path, message:"updated"
else
render action:"new"
end
end
def new
@location=Location.new
end
def create
@location=Location.new(location_params)
if @location.save
redirect_to locations_path, message:"created"
else
render action:"new"
end
end

def destroy
@location=Location.find(params[:id])
@location.destroy
redirect_to locations_path, message:"deleted"
end

private
def location_params
params.require(:location).permit(:name,:image)
end
end
