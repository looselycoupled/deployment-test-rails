class ApplicationController < ActionController::Base

  protect_from_forgery
  before_filter :add_security_headers
  before_filter :add_standards_support_header

  protected

    # ---------------------------------------------------------------------------
    # ADDITIONAL HEADERS
    # ---------------------------------------------------------------------------

    # Adds three opt-in security HTTP headers for browsers
    # Remove the first two in Rails 4 where it will already be included
    def add_security_headers
      response.headers["X-Frame-Options"] = "SAMEORIGIN"
      response.headers["X-XSS-Protection"] = "1; mode=block"
      response.headers["X-Content-Type-Options"] = "nosniff"
    end

    # Rails 4 will be removing the middleware that inserts this header
    # but it's a Threespot best practice to still send it
    def add_standards_support_header
      response.headers["X-UA-Compatible"] = "IE=Edge"
    end

    # ---------------------------------------------------------------------------
    # SYSTEM-LEVEL RENDERING/REDIRECTS
    # These functions let you nicely do code like
    # @projects = Project.find_by_id(params[:id]) or render_404
    # ---------------------------------------------------------------------------

    def render_404
      render file:"#{Rails.root}/public/404.html", status:404, layout:false
    end

    def render_403
      render file:"#{Rails.root}/public/403.html", status:403, layout:false
    end

    def render_422
      render file:"#{Rails.root}/public/422.html", status:422, layout:false
    end

    def render_500
      render file:"#{Rails.root}/public/500.html", status:500, layout:false
    end

end
