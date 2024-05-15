class AirportsController < ApplicationController
  def index
    matching_airports = Airport.all

    @list_of_airports = matching_airports.order({ :created_at => :desc })

    render({ :template => "airports/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_airports = Airport.where({ :id => the_id })

    @the_airport = matching_airports.at(0)

    render({ :template => "airports/show" })
  end

  def create
    the_airport = Airport.new
    the_airport.base = params.fetch("query_base")
    the_airport.airport = params.fetch("query_airport")

    if the_airport.valid?
      the_airport.save
      redirect_to("/airports", { :notice => "Airport created successfully." })
    else
      redirect_to("/airports", { :alert => the_airport.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_airport = Airport.where({ :id => the_id }).at(0)

    the_airport.base = params.fetch("query_base")
    the_airport.airport = params.fetch("query_airport")

    if the_airport.valid?
      the_airport.save
      redirect_to("/airports/#{the_airport.id}", { :notice => "Airport updated successfully."} )
    else
      redirect_to("/airports/#{the_airport.id}", { :alert => the_airport.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_airport = Airport.where({ :id => the_id }).at(0)

    the_airport.destroy

    redirect_to("/airports", { :notice => "Airport deleted successfully."} )
  end
end
