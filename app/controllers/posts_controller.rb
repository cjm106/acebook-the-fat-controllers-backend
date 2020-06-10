class PostsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    respond_to do |format|
      if @post.save
        format.json { render json: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def index
    @posts = Post.all
    render json: @posts
  end


  def update
   @post = Post.find(params[:id])
   if user_id = current_user.id
     respond_to do |format|
       if @post.update(update_params)
         format.json { render json: @post }
       else
         format.json { render json: @post.errors, status: :unprocessable_entity }
       end
     end
   else
     format.json { render json: @post.errors, status: :unprocessable_entity }
   end
 end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end

  def update_params
      params.require(:post).permit(:message)
  end

end

# eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTE4ODUyMzd9.po8TIc24gS5HL0iydycZxvn-fbWtOjg2QrT-gcdIJLQ

# curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTE4ODU3MTN9.9GMUPyuTrBD4mQraThRMD0qLVzYwM5tYqfnJ6zYMa_A" -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"post":{"message":"hello,world!"}}' http://localhost:3000/new
#
# curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTE4ODUzOTB9.208HifaTNHK2xJOtKWyjDE5z7drtiGa9puU-SWuOd_I" -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"post":{"message":"hello,world!"}}' http://localhost:3000/new
#
# curl -H "Content-Type: application/json" -X POST -d '{"email":"email","password":"12345"}' http://localhost:3000/login
