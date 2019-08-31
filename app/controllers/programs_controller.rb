class ProgramsController < ApplicationController
  def index
    @q = Program.ransack(params[:q])
    @programs = @q.result(:distinct => true).includes(:program_manager, :agile_teams, :business_unit).page(params[:page]).per(10)

    render("program_templates/index.html.erb")
  end

  def show
    @agile_team = AgileTeam.new
    @program = Program.find(params.fetch("id_to_display"))

    render("program_templates/show.html.erb")
  end

  def new_form
    @program = Program.new

    render("program_templates/new_form.html.erb")
  end

  def create_row
    @program = Program.new

    @program.program = params.fetch("program")
    @program.program_manager_id = params.fetch("program_manager_id")
    @program.business_unit_id = params.fetch("business_unit_id")

    if @program.valid?
      @program.save

      redirect_back(:fallback_location => "/programs", :notice => "Program created successfully.")
    else
      render("program_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_business_unit
    @program = Program.new

    @program.program = params.fetch("program")
    @program.program_manager_id = params.fetch("program_manager_id")
    @program.business_unit_id = params.fetch("business_unit_id")

    if @program.valid?
      @program.save

      redirect_to("/business_units/#{@program.business_unit_id}", notice: "Program created successfully.")
    else
      render("program_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @program = Program.find(params.fetch("prefill_with_id"))

    render("program_templates/edit_form.html.erb")
  end

  def update_row
    @program = Program.find(params.fetch("id_to_modify"))

    @program.program = params.fetch("program")
    @program.program_manager_id = params.fetch("program_manager_id")
    @program.business_unit_id = params.fetch("business_unit_id")

    if @program.valid?
      @program.save

      redirect_to("/programs/#{@program.id}", :notice => "Program updated successfully.")
    else
      render("program_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_program_manager
    @program = Program.find(params.fetch("id_to_remove"))

    @program.destroy

    redirect_to("/users/#{@program.program_manager_id}", notice: "Program deleted successfully.")
  end

  def destroy_row_from_business_unit
    @program = Program.find(params.fetch("id_to_remove"))

    @program.destroy

    redirect_to("/business_units/#{@program.business_unit_id}", notice: "Program deleted successfully.")
  end

  def destroy_row
    @program = Program.find(params.fetch("id_to_remove"))

    @program.destroy

    redirect_to("/programs", :notice => "Program deleted successfully.")
  end
end
