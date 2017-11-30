class PostsController < ApplicationController
  def index
    #全データを作成日の降順で取得
    @posts = Post.all.order(created_at: 'desc')
  end

  def show
    #post変数に各Postの値を設定 :idを引数にすることにより、特定のデータが取得できる
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # 送信されたデータをそのまま表示できる
    # render plain: params[:post].inspect
    # save
    # railsでは登録されるデータの整合性をとるため、strong Parametersを設定する必要がある
    # @post = Post.new(params[:post])
    # strong Parameters → titleとbodyがあるハッシュではないといけませんよ、という意味
    # @post = Post.new(params.require(:post).permit(:title, :body))
    # 上記の部分はprivateメソッドにまとめることができる
    @post = Post.new(post_params)
    if @post.save
      # redirect
      redirect_to posts_path
    else
      # render plain: @post.errors.inspect
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    # 更新処理が成功した場合は一覧へ、失敗した場合はその画面に止まる
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    # 削除する記事の特定
    @post = Post.find(params[:id])
    # 削除
    @post.destroy
    # 記事一覧へリダイレクト
    redirect_to posts_path
  end

  private
    # ストロングパラメータ
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
