class PhotosController < ApplicationController
  def index
    @photos = Photo.all

    render("photos/index.html.erb")
  end

  def show
    @like = Like.new
    @comment = Comment.new
    @photo = Photo.find(params[:id])

    render("photos/show.html.erb")
  end

  def new
    @photo = Photo.new

    render("photos/new.html.erb")
  end

  def create
    @photo = Photo.new

    @photo.image = params[:image]
    @photo.location = params[:location]
    @photo.caption = params[:caption]

    save_status = @photo.save

    if save_status == true
      redirect_to(:back, :notice => "Photo created successfully.")
    else
      render("photos/new.html.erb")
    end
  end

  def edit
    @photo = Photo.find(params[:id])

    render("photos/edit.html.erb")
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.image = params[:image]
    @photo.location = params[:location]
    @photo.caption = params[:caption]

    save_status = @photo.save

    if save_status == true
      redirect_to(:back, :notice => "Photo updated successfully.")
    else
      render("photos/edit.html.erb")
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    @photo.destroy

    redirect_to(:back, :notice => "Photo deleted.")
  end
end
