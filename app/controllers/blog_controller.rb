class BlogController < ApplicationController
  def index
    @posts = Post.all(:order => "received_dt desc")
    @next = nil
    @prev = nil
    if params[:skip]
      @posts.slice!(0, params[:skip].to_i)
      @next = "/blog/index#{if params[:skip].to_i <= 5 then
          "" else "?skip=#{params[:skip].to_i - 5}" end}"
    end
     if @posts.length > 5
       @prev = "/blog/index?skip=#{params[:skip].to_i + 5}"
     end
     #@posts = @posts.take(5)
     @posts = @posts[0, [@posts.length, 5].min()]
  end

  def show
    @post_container = Post.first(:conditions => {
        :post_type => params[:post_type],
        :post_date => params[:post_date]})
    #@post = "#{Rails.root.to_s}/#{@post_container.post}"
    
    post = File.split(@post_container.post).last
    @post = File.join('blog', post)
    year, month, day = params[:post_date].split('-').collect{|s| s.to_i}
    @prettydt = Time.local(year, month, day).strftime('%d %b %Y')

    @prev_container = Post.first(
        :select => "post_date, post_type, received_dt",
        :conditions => ["received_dt < ?",
            @post_container.received_dt.strftime('%Y-%m-%d %H:%M:%S')],
        :order => "received_dt desc")
    @prev_post = if @prev_container then
        "/blog/#{@prev_container.post_type}/#{@prev_container.post_date}"
        else nil end
    @next_container = Post.first(
        :select => "post_date, post_type, received_dt",
        :conditions => ["received_dt > ?",
            @post_container.received_dt.strftime('%Y-%m-%d %H:%M:%S')],
        :order => "received_dt")
    @next_post = if @next_container then
        "/blog/#{@next_container.post_type}/#{@next_container.post_date}"
        else nil end

    if @prev_post
      @prev_prettydt = @prev_container.post_date.strftime('%d %b %Y')
    end
    if @next_post
      @next_prettydt = @next_container.post_date.strftime('%d %b %Y')
    end

    @lat = @post_container.latitude
    @lng = @post_container.longitude
  end

  def edit
  end

  def new
  end

  def delete
  end

end
