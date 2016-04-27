class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate, :only => [:service_index, :service_articles_by_store]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.includes(:store)
  end

  # List all articles service.
  # GET /services/articles
  def service_index
    @articles = Article.includes(:store)
    render json: { articles: @articles, success: true, total_elements: @articles.count }
  end

  # List all the articles that are in a specific store service.
  # GET /services/articles/stores/:id
  def service_articles_by_store
    begin
      i = Integer(params[:id])
      @articles = Article.where(:store_id => i)
      
      if(@articles.count > 0)
        render json: { articles: @articles, success: true, total_elements: @articles.count }
      else
        render json: { error_msg: 'Record not Found', error_code: 404, success: false }
      end
    rescue ArgumentError
      render json: { error_msg: 'Bad Request', error_code: 400, success: false}
    end
  end
  
  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :description, :price, :total_in_shelf, :total_in_vault, :store_id)
    end
end
