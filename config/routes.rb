Rails.application.routes.draw do
  # Routes for the Supervisor resource:

  # CREATE
  post("/insert_supervisor", { :controller => "supervisors", :action => "create" })
          
  # READ
  get("/supervisors", { :controller => "supervisors", :action => "index" })
  
  get("/supervisors/:path_id", { :controller => "supervisors", :action => "show" })
  
  # UPDATE
  
  post("/modify_supervisor/:path_id", { :controller => "supervisors", :action => "update" })
  
  # DELETE
  get("/delete_supervisor/:path_id", { :controller => "supervisors", :action => "destroy" })

  #------------------------------

  devise_for :users

  root to: "users#index"

  get("/users", { :controller => "users", :action => "index" })
  get("/", { :controller => "users", :action => "index" })
  get("/users/:path_id", { :controller => "users", :action => "show" })

  post("/modify_user/:path_id", { :controller => "users", :action => "update" })

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
