class PostsController < ApplicationController

	before_action :authenticate_user!, except: [ :index, :show ]
	
	before_action :set_post, only: [ :show, :edit, :update ]

	def index
	   @posts = Post.paginate(page: params[:page], per_page: 5)
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else 
		  	render :new
		end
	end

	def edit
	end

	def update
		if @post.update_attributes(post_params)
			redirect_to @post, sucсess: 'Статья успешно обновлена'
		else 
			render :edit, danger: 'Статья не обнавлена'
		end
	end

	def destroy 
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to post_path
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :summary, :body, :image)
	end
end 