class BusinessUnitsController < ApplicationController
  def index
    @business_units = BusinessUnit.all

    render("business_unit_templates/index.html.erb")
  end

  def show
    @program = Program.new
    @business_unit = BusinessUnit.find(params.fetch("id_to_display"))

    render("business_unit_templates/show.html.erb")
  end

  def new_form
    @business_unit = BusinessUnit.new

    render("business_unit_templates/new_form.html.erb")
  end

  def create_row
    @business_unit = BusinessUnit.new

    @business_unit.business_unit = params.fetch("business_unit")
    @business_unit.director_id = params.fetch("director_id")
    @business_unit.operating_unit_id = params.fetch("operating_unit_id")

    if @business_unit.valid?
      @business_unit.save

      redirect_back(:fallback_location => "/business_units", :notice => "Business unit created successfully.")
    else
      render("business_unit_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_operating_unit
    @business_unit = BusinessUnit.new

    @business_unit.business_unit = params.fetch("business_unit")
    @business_unit.director_id = params.fetch("director_id")
    @business_unit.operating_unit_id = params.fetch("operating_unit_id")

    if @business_unit.valid?
      @business_unit.save

      redirect_to("/operating_units/#{@business_unit.operating_unit_id}", notice: "BusinessUnit created successfully.")
    else
      render("business_unit_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @business_unit = BusinessUnit.find(params.fetch("prefill_with_id"))

    render("business_unit_templates/edit_form.html.erb")
  end

  def update_row
    @business_unit = BusinessUnit.find(params.fetch("id_to_modify"))

    @business_unit.business_unit = params.fetch("business_unit")
    @business_unit.director_id = params.fetch("director_id")
    @business_unit.operating_unit_id = params.fetch("operating_unit_id")

    if @business_unit.valid?
      @business_unit.save

      redirect_to("/business_units/#{@business_unit.id}", :notice => "Business unit updated successfully.")
    else
      render("business_unit_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_director
    @business_unit = BusinessUnit.find(params.fetch("id_to_remove"))

    @business_unit.destroy

    redirect_to("/users/#{@business_unit.director_id}", notice: "BusinessUnit deleted successfully.")
  end

  def destroy_row_from_operating_unit
    @business_unit = BusinessUnit.find(params.fetch("id_to_remove"))

    @business_unit.destroy

    redirect_to("/operating_units/#{@business_unit.operating_unit_id}", notice: "BusinessUnit deleted successfully.")
  end

  def destroy_row
    @business_unit = BusinessUnit.find(params.fetch("id_to_remove"))

    @business_unit.destroy

    redirect_to("/business_units", :notice => "Business unit deleted successfully.")
  end
end
