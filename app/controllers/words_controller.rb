class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  def index
    @words = current_user.words.alphabetical
  end

  def show
  end

  def new
    @word = Word.new
  end

  def edit
  end

  def update
    @word.update!(word_params)
    redirect_to word_url, notice: "タスク「#{@word.name}」を更新しました。"
  end

  def destroy
    @word.destroy
    redirect_to words_url, notice: "タスク「#{@word.name}」を削除しました。"
  end

  def create
    @word = current_user.words.new(word_params)
    if @word.save
      redirect_to words_url, notice: "単語「#{@word.name}」を登録しました。"
    else
      render :new
    end
  end

  private
    def word_params
      params.require(:word).permit(:name, :example, :translation)
    end

    def set_word
      @word = current_user.words.find(params[:id])
    end
end
