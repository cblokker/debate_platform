class DebatesController < ApplicationController

  def index
    @recent_debates = Debate.order(created_at: :desc).limit(10)
  end

  def index_popular
    @recent_debates = Debate.order(total_votes: :desc).limit(10)
    render :index
  end

  def index_agree
    @recent_debates = Debate.order(votes_for: :desc).limit(10)
    render :index
  end

  def index_disagree
    @recent_debates = Debate.order(votes_against: :desc).limit(10)
    render :index
  end

  def show
    @debate = Debate.find(params[:id])
    if @debate.comments
      @agree_comments = @debate.comments.where(agree: true).order(vote_count: :desc)
      @disagree_comments = @debate.comments.where(agree: false).order(vote_count: :desc)
    end
  end

  def new
    @debate = Debate.new
    @topic = Topic.all
  end

  def create
    params[:topic_id].to_i
    @debate = Debate.new(debate_params)

    if @debate.save
      redirect_to @debate, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def debate_params
    params.require(:debate).permit(:title, :body, :user_id, :topic_id)
  end

end
