require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

# ////PRESENTS USER WITH A FORM FOR NEW BLOG POST////
  get '/posts/new' do
    erb :new
  end

# ////CREATES NEW 'Post' OBJECT AND RENDERS NEW POST TO INDEX VIEW////
  post '/posts' do
    @new_post = Post.create(params)
    erb :index
  end

# ////SHOWS ALL POSTS////
  get '/posts' do
    erb :index
  end


# ////SHOW SINGLE POST BY ID////
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

# ///UPDATE///
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

# ////DELETE POST///
  delete '/posts/:id/delete' do
    @post2 = Post.find(params[:id])
    @post2.delete
    erb :delete

  end

end
