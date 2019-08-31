Rails.application.routes.draw do
  # Routes for the Operating unit resource:

  # CREATE
  get("/operating_units/new", { :controller => "operating_units", :action => "new_form" })
  post("/create_operating_unit", { :controller => "operating_units", :action => "create_row" })

  # READ
  get("/operating_units", { :controller => "operating_units", :action => "index" })
  get("/operating_units/:id_to_display", { :controller => "operating_units", :action => "show" })

  # UPDATE
  get("/operating_units/:prefill_with_id/edit", { :controller => "operating_units", :action => "edit_form" })
  post("/update_operating_unit/:id_to_modify", { :controller => "operating_units", :action => "update_row" })

  # DELETE
  get("/delete_operating_unit/:id_to_remove", { :controller => "operating_units", :action => "destroy_row" })

  #------------------------------

  # Routes for the Business unit resource:

  # CREATE
  get("/business_units/new", { :controller => "business_units", :action => "new_form" })
  post("/create_business_unit", { :controller => "business_units", :action => "create_row" })

  # READ
  get("/business_units", { :controller => "business_units", :action => "index" })
  get("/business_units/:id_to_display", { :controller => "business_units", :action => "show" })

  # UPDATE
  get("/business_units/:prefill_with_id/edit", { :controller => "business_units", :action => "edit_form" })
  post("/update_business_unit/:id_to_modify", { :controller => "business_units", :action => "update_row" })

  # DELETE
  get("/delete_business_unit/:id_to_remove", { :controller => "business_units", :action => "destroy_row" })

  #------------------------------

  # Routes for the Program resource:

  # CREATE
  get("/programs/new", { :controller => "programs", :action => "new_form" })
  post("/create_program", { :controller => "programs", :action => "create_row" })

  # READ
  get("/programs", { :controller => "programs", :action => "index" })
  get("/programs/:id_to_display", { :controller => "programs", :action => "show" })

  # UPDATE
  get("/programs/:prefill_with_id/edit", { :controller => "programs", :action => "edit_form" })
  post("/update_program/:id_to_modify", { :controller => "programs", :action => "update_row" })

  # DELETE
  get("/delete_program/:id_to_remove", { :controller => "programs", :action => "destroy_row" })

  #------------------------------

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
