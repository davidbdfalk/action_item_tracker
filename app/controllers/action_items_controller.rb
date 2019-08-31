class ActionItemsController < ApplicationController
  before_action :current_user_must_be_action_item_sender, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_action_item_sender
    action_item = ActionItem.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == action_item.sender
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.received_follow_requests.ransack(params[:q])
    @action_items = @q.result(:distinct => true).includes(:sender, :recipient, :comments).page(params[:page]).per(10)

    render("action_item_templates/index.html.erb")
  end

  def show
    @comment = Comment.new
    @action_item = ActionItem.find(params.fetch("id_to_display"))

    render("action_item_templates/show.html.erb")
  end

  def new_form
    @action_item = ActionItem.new

    render("action_item_templates/new_form.html.erb")
  end

  def create_row
    @action_item = ActionItem.new

    @action_item.assigner_id = params.fetch("assigner_id")
    @action_item.actionee_id = params.fetch("actionee_id")
    @action_item.action_item = params.fetch("action_item")
    @action_item.description = params.fetch("description")
    @action_item.deadline = params.fetch("deadline")
    @action_item.status = params.fetch("status")

    if @action_item.valid?
      @action_item.save

      redirect_back(:fallback_location => "/action_items", :notice => "Action item created successfully.")
    else
      render("action_item_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @action_item = ActionItem.find(params.fetch("prefill_with_id"))

    render("action_item_templates/edit_form.html.erb")
  end

  def update_row
    @action_item = ActionItem.find(params.fetch("id_to_modify"))

    
    @action_item.actionee_id = params.fetch("actionee_id")
    @action_item.action_item = params.fetch("action_item")
    @action_item.description = params.fetch("description")
    @action_item.deadline = params.fetch("deadline")
    @action_item.status = params.fetch("status")

    if @action_item.valid?
      @action_item.save

      redirect_to("/action_items/#{@action_item.id}", :notice => "Action item updated successfully.")
    else
      render("action_item_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_sender
    @action_item = ActionItem.find(params.fetch("id_to_remove"))

    @action_item.destroy

    redirect_to("/users/#{@action_item.assigner_id}", notice: "ActionItem deleted successfully.")
  end

  def destroy_row_from_recipient
    @action_item = ActionItem.find(params.fetch("id_to_remove"))

    @action_item.destroy

    redirect_to("/users/#{@action_item.actionee_id}", notice: "ActionItem deleted successfully.")
  end

  def destroy_row
    @action_item = ActionItem.find(params.fetch("id_to_remove"))

    @action_item.destroy

    redirect_to("/action_items", :notice => "Action item deleted successfully.")
  end
end
