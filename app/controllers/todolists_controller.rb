class TodolistsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

  Refile.secret_key = '75daed7cbc8d68ecef123f3414e44879a01da711df8d2b9f52dfc67a88d14befbbc698361a86edec1cff391e613424dc78d634cb53f15435fdfa956453a61d03'

end
