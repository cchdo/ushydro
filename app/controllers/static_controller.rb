class StaticController < ApplicationController
  layout "standard"
  
  def index
    ppath = params[:path]
    layout = nil
    if ppath and ppath.kind_of?(Array) and not ppath.empty? and ppath[0] =~ /^s4p/i
      layout = 's4p'
    end
    
    if template_exists? path = 'static/' + params[:path].join('/')
       render_cached path, layout
    elsif template_exists? path+'/index.html'
        render_cached path+'/index.html', layout
    else template_exists? path+'/index.rhtml'
      render_cached path+'/index.rhtml', layout
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

  def render_cached(path, layout=nil)
    # if NO_CACHE.include? path
    if layout
      render :template => path, :layout => layout
    else 
      render :template => path
    end
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
