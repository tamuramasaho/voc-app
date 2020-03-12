class WordsController < ApplicationController
  before_action :set_word, only: %i[show edit update destroy
                                    remember_update]

  def index
    @q = current_user.words.ransack(params[:q])
    @words = @q.result(distinct: true).alphabetical
    # @words = @q.result(distinct: true).alphabetical.page(params[:page])
    respond_to do |format|
      format.html
      format.csv do
        send_data @words.generate_csv,
                  filename: "words-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"
      end
    end
  end

  def import
    if current_user.words.import(params[:file])
      redirect_to words_url, notice: '単語を登録しました'
    else
      redirect_to words_url, notice: 'CSVファイルを選択してください'
    end
  end

  def show; end

  def new
    @word = current_user.words.new
  end

  def edit; end

  def update
    @word.update!(word_params)
    redirect_to word_url, notice: "タスク「#{@word.name}」を更新しました。"
  end

  def remember_update
    @word.update!(word_params)
  end

  def destroy
    @word.destroy
    redirect_to words_url, notice: "単語「#{@word.name}」を削除しました。"
  end

  def create
    @word = current_user.words.new(word_params)

    if @word.save
      logger.debug "word: #{@word.attributes.inspect}"
      redirect_to words_url, notice: "単語「#{@word.name}」を登録しました。"
    else
      render :new
    end
  end

  private

  def word_params
    params.require(:word).permit(
      :name,
      :example,
      :translation,
      :image,
      :remember
    )
  end

  def set_word
    @word = current_user.words.find(params[:id])
  end
end
