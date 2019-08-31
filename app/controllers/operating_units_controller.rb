class OperatingUnitsController < ApplicationController
  def index
    @operating_units = OperatingUnit.all

    render("operating_unit_templates/index.html.erb")
  end

  def show
    @operating_unit = OperatingUnit.find(params.fetch("id_to_display"))

    render("operating_unit_templates/show.html.erb")
  end

  def new_form
    @operating_unit = OperatingUnit.new

    render("operating_unit_templates/new_form.html.erb")
  end

  def create_row
    @operating_unit = OperatingUnit.new

    @operating_unit.operating_unit = params.fetch("operating_unit")
    @operating_unit.vice_president_id = params.fetch("vice_president_id")

    if @operating_unit.valid?
      @operating_unit.save

      redirect_back(:fallback_location => "/operating_units", :notice => "Operating unit created successfully.")
    else
      render("operating_unit_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @operating_unit = OperatingUnit.find(params.fetch("prefill_with_id"))

    render("operating_unit_templates/edit_form.html.erb")
  end

  def update_row
    @operating_unit = OperatingUnit.find(params.fetch("id_to_modify"))

    @operating_unit.operating_unit = params.fetch("operating_unit")
    @operating_unit.vice_president_id = params.fetch("vice_president_id")

    if @operating_unit.valid?
      @operating_unit.save

      redirect_to("/operating_units/#{@operating_unit.id}", :notice => "Operating unit updated successfully.")
    else
      render("operating_unit_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_vice_president
    @operating_unit = OperatingUnit.find(params.fetch("id_to_remove"))

    @operating_unit.destroy

    redirect_to("/users/#{@operating_unit.vice_president_id}", notice: "OperatingUnit deleted successfully.")
  end

  def destroy_row
    @operating_unit = OperatingUnit.find(params.fetch("id_to_remove"))

    @operating_unit.destroy

    redirect_to("/operating_units", :notice => "Operating unit deleted successfully.")
  end
end
