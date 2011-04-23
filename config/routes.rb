Rails.application.routes.draw do
  resource :admin, :controller => 'admin', :only => [:show] do
    resource :snippets, :controller => 'admin/snippets', :only => [:show, :update]
  end
end
