Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "action_items#index"
  # Routes for the Agile team resource:

  # CREATE
  get("/agile_teams/new", { :controller => "agile_teams", :action => "new_form" })
  post("/create_agile_team", { :controller => "agile_teams", :action => "create_row" })
  post("/create_agile_team_from_program", { :controller => "agile_teams", :action => "create_row_from_program" })

  # READ
  get("/agile_teams", { :controller => "agile_teams", :action => "index" })
  get("/agile_teams/:id_to_display", { :controller => "agile_teams", :action => "show" })

  # UPDATE
  get("/agile_teams/:prefill_with_id/edit", { :controller => "agile_teams", :action => "edit_form" })
  post("/update_agile_team/:id_to_modify", { :controller => "agile_teams", :action => "update_row" })

  # DELETE
  get("/delete_agile_team/:id_to_remove", { :controller => "agile_teams", :action => "destroy_row" })
  get("/delete_agile_team_from_program/:id_to_remove", { :controller => "agile_teams", :action => "destroy_row_from_program" })
  get("/delete_agile_team_from_scrum_master/:id_to_remove", { :controller => "agile_teams", :action => "destroy_row_from_scrum_master" })

  #------------------------------

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
  get("/delete_operating_unit_from_vice_president/:id_to_remove", { :controller => "operating_units", :action => "destroy_row_from_vice_president" })

  #------------------------------

  # Routes for the Business unit resource:

  # CREATE
  get("/business_units/new", { :controller => "business_units", :action => "new_form" })
  post("/create_business_unit", { :controller => "business_units", :action => "create_row" })
  post("/create_business_unit_from_operating_unit", { :controller => "business_units", :action => "create_row_from_operating_unit" })

  # READ
  get("/business_units", { :controller => "business_units", :action => "index" })
  get("/business_units/:id_to_display", { :controller => "business_units", :action => "show" })

  # UPDATE
  get("/business_units/:prefill_with_id/edit", { :controller => "business_units", :action => "edit_form" })
  post("/update_business_unit/:id_to_modify", { :controller => "business_units", :action => "update_row" })

  # DELETE
  get("/delete_business_unit/:id_to_remove", { :controller => "business_units", :action => "destroy_row" })
  get("/delete_business_unit_from_operating_unit/:id_to_remove", { :controller => "business_units", :action => "destroy_row_from_operating_unit" })
  get("/delete_business_unit_from_director/:id_to_remove", { :controller => "business_units", :action => "destroy_row_from_director" })

  #------------------------------

  # Routes for the Program resource:

  # CREATE
  get("/programs/new", { :controller => "programs", :action => "new_form" })
  post("/create_program", { :controller => "programs", :action => "create_row" })
  post("/create_program_from_business_unit", { :controller => "programs", :action => "create_row_from_business_unit" })

  # READ
  get("/programs", { :controller => "programs", :action => "index" })
  get("/programs/:id_to_display", { :controller => "programs", :action => "show" })

  # UPDATE
  get("/programs/:prefill_with_id/edit", { :controller => "programs", :action => "edit_form" })
  post("/update_program/:id_to_modify", { :controller => "programs", :action => "update_row" })

  # DELETE
  get("/delete_program/:id_to_remove", { :controller => "programs", :action => "destroy_row" })
  get("/delete_program_from_business_unit/:id_to_remove", { :controller => "programs", :action => "destroy_row_from_business_unit" })
  get("/delete_program_from_program_manager/:id_to_remove", { :controller => "programs", :action => "destroy_row_from_program_manager" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  get("/comments/new", { :controller => "comments", :action => "new_form" })
  post("/create_comment", { :controller => "comments", :action => "create_row" })
  post("/create_comment_from_action_item", { :controller => "comments", :action => "create_row_from_action_item" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  get("/comments/:id_to_display", { :controller => "comments", :action => "show" })

  # UPDATE
  get("/comments/:prefill_with_id/edit", { :controller => "comments", :action => "edit_form" })
  post("/update_comment/:id_to_modify", { :controller => "comments", :action => "update_row" })

  # DELETE
  get("/delete_comment/:id_to_remove", { :controller => "comments", :action => "destroy_row" })
  get("/delete_comment_from_action_item/:id_to_remove", { :controller => "comments", :action => "destroy_row_from_action_item" })
  get("/delete_comment_from_commenter/:id_to_remove", { :controller => "comments", :action => "destroy_row_from_commenter" })

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
  get("/delete_action_item_from_recipient/:id_to_remove", { :controller => "action_items", :action => "destroy_row_from_recipient" })
  get("/delete_action_item_from_sender/:id_to_remove", { :controller => "action_items", :action => "destroy_row_from_sender" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
