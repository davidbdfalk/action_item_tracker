class ActionItemsController < ApplicationController
  def index
    @action_items = ActionItem.all

    render("action_item_templates/index.html.erb")
  end

  def show
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

    @action_item.assigner_id = params.fetch("assigner_id")
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

  def destroy_row
    @action_item = ActionItem.find(params.fetch("id_to_remove"))

    @action_item.destroy

    redirect_to("/action_items", :notice => "Action item deleted successfully.")
  end
end
