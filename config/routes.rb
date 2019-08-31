Rails.application.routes.draw do
  # Routes for the Comment resource:

  # CREATE
  get("/comments/new", { :controller => "comments", :action => "new_form" })
  post("/create_comment", { :controller => "comments", :action => "create_row" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  get("/comments/:id_to_display", { :controller => "comments", :action => "show" })

  # UPDATE
  get("/comments/:prefill_with_id/edit", { :controller => "comments", :action => "edit_form" })
  post("/update_comment/:id_to_modify", { :controller => "comments", :action => "update_row" })

  # DELETE
  get("/delete_comment/:id_to_remove", { :controller => "comments", :action => "destroy_row" })

  #------------------------------

  # Routes for the Action item resource:

  # CREATE
  get("/action_items/new", { :controller => "action_items", :action => "new_form" })
  post("/create_action_item", { :controller => "action_items", :action => "create_row" })

  # READ
  get("/action_items", { :controller => "action_items", :action => "index" })
  get("/action_items/:id_to_display", { :controller => "action_items", :action => "show" })

  # UPDATE
  get("/action_items/:prefill_with_id/edit", { :controller => "action_items", :action => "edit_form" })
  post("/update_action_item/:id_to_modify", { :controller => "action_items", :action => "update_row" })

  # DELETE
  get("/delete_action_item/:id_to_remove", { :controller => "action_items", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
