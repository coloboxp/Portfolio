module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = if current_user.is_a?(User)
                    'Welcome to my Portfolio Website'
                  else
                    'My Portfolio Website'
                  end

    @seo_keywords = "IT, AI, Paytech, PM, Image Processing, Biometry, C#"
  end
end
