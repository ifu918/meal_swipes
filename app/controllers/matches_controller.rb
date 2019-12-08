class MatchesController < ApplicationController
  def index
    @matches = Match.all

    render("match_templates/index.html.erb")
  end

  def show
    @match = Match.find(params.fetch("id_to_display"))

    render("match_templates/show.html.erb")
  end

  def new_form
    @match = Match.new

    render("match_templates/new_form.html.erb")
  end

  def create_row
    @match = Match.new

    @match.seller = params.fetch("seller")
    @match.buyer = params.fetch("buyer")
    @match.dining_hall = params.fetch("dining_hall")
    @match.price = params.fetch("price")
    @match.meeting_time = params.fetch("meeting_time")

    if @match.valid?
      @match.save

      redirect_back(:fallback_location => "/matches", :notice => "Match created successfully.")
    else
      render("match_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @match = Match.find(params.fetch("prefill_with_id"))

    render("match_templates/edit_form.html.erb")
  end

  def update_row
    @match = Match.find(params.fetch("id_to_modify"))

    @match.seller = params.fetch("seller")
    @match.buyer = params.fetch("buyer")
    @match.dining_hall = params.fetch("dining_hall")
    @match.price = params.fetch("price")
    @match.meeting_time = params.fetch("meeting_time")

    if @match.valid?
      @match.save

      redirect_to("/matches/#{@match.id}", :notice => "Match updated successfully.")
    else
      render("match_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_creator
    @match = Match.find(params.fetch("id_to_remove"))

    @match.destroy

    redirect_to("/users/#{@match.seller}", notice: "Match deleted successfully.")
  end

  def destroy_row
    @match = Match.find(params.fetch("id_to_remove"))

    @match.destroy

    redirect_to("/matches", :notice => "Match deleted successfully.")
  end
end
