class ProgramsController < ApplicationController
  def index
    @programs = Program.all

    render("program_templates/index.html.erb")
  end

  def show
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

  def destroy_row
    @program = Program.find(params.fetch("id_to_remove"))

    @program.destroy

    redirect_to("/programs", :notice => "Program deleted successfully.")
  end
end
