class CommentsController < ApplicationController
  before_action :current_user_must_be_comment_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_comment_user
    comment = Comment.find(params[:id])

    unless current_user == comment.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @comments = Comment.page(params[:page])

    render("comments/index.html.erb")
  end

  def show
    @comment = Comment.find(params[:id])

    render("comments/show.html.erb")
  end

  def new
    @comment = Comment.new

    render("comments/new.html.erb")
  end

  def create
    @comment = Comment.new

    @comment.user_id = params[:user_id]
    @comment.photo_id = params[:photo_id]

    save_status = @comment.save

    if save_status == true
      redirect_to(:back, :notice => "Comment created successfully.")
    else
      render("comments/new.html.erb")
    end
  end

  def edit
    @comment = Comment.find(params[:id])

    render("comments/edit.html.erb")
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.user_id = params[:user_id]
    @comment.photo_id = params[:photo_id]

    save_status = @comment.save

    if save_status == true
      redirect_to(:back, :notice => "Comment updated successfully.")
    else
      render("comments/edit.html.erb")
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to(:back, :notice => "Comment deleted.")
  end
end
