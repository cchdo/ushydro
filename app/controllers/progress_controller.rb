class ProgressController < ApplicationController
  layout 's4p'
  def index
  end

  def positions
    respond_to do |format|
      format.json { render :json => Position.all() }
      format.xml { render :xml => Position.all() }
    end
  end

  def posts
    respond_to do |format|
      format.json { render :json => Post.all() }
      format.xml { render :xml => Post.all() }
    end
  end

end
