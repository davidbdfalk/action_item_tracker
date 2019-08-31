class AgileTeamsController < ApplicationController
  def index
    @agile_teams = AgileTeam.all

    render("agile_team_templates/index.html.erb")
  end

  def show
    @agile_team = AgileTeam.find(params.fetch("id_to_display"))

    render("agile_team_templates/show.html.erb")
  end

  def new_form
    @agile_team = AgileTeam.new

    render("agile_team_templates/new_form.html.erb")
  end

  def create_row
    @agile_team = AgileTeam.new

    @agile_team.agile_team = params.fetch("agile_team")
    @agile_team.scrum_master_id = params.fetch("scrum_master_id")
    @agile_team.program_id = params.fetch("program_id")

    if @agile_team.valid?
      @agile_team.save

      redirect_back(:fallback_location => "/agile_teams", :notice => "Agile team created successfully.")
    else
      render("agile_team_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @agile_team = AgileTeam.find(params.fetch("prefill_with_id"))

    render("agile_team_templates/edit_form.html.erb")
  end

  def update_row
    @agile_team = AgileTeam.find(params.fetch("id_to_modify"))

    @agile_team.agile_team = params.fetch("agile_team")
    @agile_team.scrum_master_id = params.fetch("scrum_master_id")
    @agile_team.program_id = params.fetch("program_id")

    if @agile_team.valid?
      @agile_team.save

      redirect_to("/agile_teams/#{@agile_team.id}", :notice => "Agile team updated successfully.")
    else
      render("agile_team_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @agile_team = AgileTeam.find(params.fetch("id_to_remove"))

    @agile_team.destroy

    redirect_to("/agile_teams", :notice => "Agile team deleted successfully.")
  end
end
