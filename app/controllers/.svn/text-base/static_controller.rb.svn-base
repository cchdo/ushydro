class StaticController < ApplicationController
  layout "standard"
  
  def index
    
    if template_exists? path = 'static/' + params[:path].join('/')
       render_cached path
    elsif template_exists? path+'/index.html'
        render_cached path+'/index.html'
    else template_exists? path+'/index.rhtml'
      render_cached path+'/index.rhtml'
    end
  end
  
  private
  # Define template_exists? for Rails 2.3 (cause it's deprecated)
  unless ActionController::Base.private_instance_methods.include? 'template_exists?'
    def template_exists?(path)
      self.view_paths.find_template(path, response.template.template_format)
    rescue ActionView::MissingTemplate
      false
    end
  end

  def render_cached(path)
    # if NO_CACHE.include? path
    render :template => path
   #  else
   #     key = path.gsub('/', '-')
   #     unless content = read_fragment(key)
   #        content = render_to_string :template => path, :layout => false
   #        write_fragment(key, content)
   #     end
   #     render :text => content, :layout => true
   #  end
  end
end
