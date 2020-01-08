class TodosController < ApplicationController
  # before_action :action名, only: [:action名1, :action名2, ...]
  # before_action :action名  =>  actionの前にcall
  # only: [:action名1, :action名2, ...]  =>  ここで指定したactionの前にbefore_actionがcall
  before_action :set_todo, only: [:show, :edit, :update, :status, :destroy]

  # GET /todos
  # GET /todos.json
  # '/'でtodosコントローラーが叩かれてindexアクションがcallされる
  # => '$ bin/rails routes'で確認
  def index
    @todos = Todo.where(status: 0).order(priority: "DESC") #インスタンス変数@todosを使っているのは、後でviewで利用するため(複数形)　#[参考]http://igarashikuniaki.net/rails_textbook/crud.html
    # sinatraで言う「erb :index」がない...
    # =>「views > todos > index.html.erb」を探してくれる
    # つまり、'Controller'xxxアクションがcallされるとデフォルトで'views'xxx.html.erbをrender
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    # =>「views > todos > show.html.erb」を探してくれる
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params) # @todo(インスタンス変数)=>Railsの場合は、1つのリクエスト内が有効範囲だと考えれる(redirect_toは有効範囲外)

    # TODO:respond_toとは？
    respond_to do |format|
      if @todo.save
        # 'format.html','format.json'は拡張子を表す(例：format.html{...} => 「formatがhtmlの場合は...」みたいな)
        # TODO:'@todo'インスタンスだけ渡す→対応したshowアクションが呼び出される?renderが呼び出される？
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
        # [renderとrefirect_to]https://qiita.com/1ulce/items/282cccba1e44158489c8
        # [renderとrefirect_to(図解)]http://igarashikuniaki.net/rails_textbook/new-create.html
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      # @todoをいきなり使ってる => before_actionでset_todoアクションが先に呼ばれる為
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # [追加アクション]PATCH /todos/1/status (→routes.rb)
  def status
    @todo.status = params[:status]
    @todo.save!
    redirect_to root_url, notice: "「#{@todo.title}」を完了しました！" #root_url => idnexへ飛ばす
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      # Todo(model名(ActiveRecord)⇄tabel名(DB))からprams[:id]をfind
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      # データを取得
      # セキュリティの為の機能(Strong Parameters)
        # paramsに入ってくる値を指定（それ以外入るとerror => Unpermitted parameter: xxx）
      params.require(:todo).permit(:title, :detail, :status, :priority, :category_id)
      # ===== params.require(:todo).permit(:title, :detail, :status)とは？ =====
      # params[:todo] = {title: "first", details: "詳細", status: 1}みたいなをそれぞれ「データ取得」
      # params[:todo][:title] # => "first"
      # => params.require(:モデル名).permit(:カラム名1, :カラム名2, ...)
      # [関連]「form_for」(views>todos>_form.html.erb)
    end
end
