class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    word = Word.find(params[:id])
    word.update!(word_params)
    redirect_to word_url, notice: "タスク「#{word.name}」を更新しました。"
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to words_url, notice: "タスク「#{word.name}」を削除しました。"
  end

  def create
    word = Word.new(word_params)
    word.save!
    redirect_to words_url, notice: "単語「#{word.name}」を登録しました。"
  end

  private
    def word_params
      params.require(:word).permit(:name, :example, :translation)
    end
end
