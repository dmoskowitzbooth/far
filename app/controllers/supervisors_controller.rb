class SupervisorsController < ApplicationController
  def index
    matching_supervisors = Supervisor.all

    @list_of_supervisors = matching_supervisors.order({ :created_at => :desc })

    render({ :template => "supervisors/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_supervisors = Supervisor.where({ :id => the_id })

    @the_supervisor = matching_supervisors.at(0)

    render({ :template => "supervisors/show" })
  end

  def create
    the_supervisor = Supervisor.new
    the_supervisor.sup_id = params.fetch("query_sup_id")
    the_supervisor.first_name = params.fetch("query_first_name")
    the_supervisor.last_name = params.fetch("query_last_name")
    the_supervisor.email = params.fetch("query_email")
    the_supervisor.phone = params.fetch("query_phone")
    the_supervisor.conference_number = params.fetch("query_conference_number")

    if the_supervisor.valid?
      the_supervisor.save
      redirect_to("/supervisors", { :notice => "Supervisor created successfully." })
    else
      redirect_to("/supervisors", { :alert => the_supervisor.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_supervisor = Supervisor.where({ :id => the_id }).at(0)

    the_supervisor.sup_id = params.fetch("query_sup_id")
    the_supervisor.first_name = params.fetch("query_first_name")
    the_supervisor.last_name = params.fetch("query_last_name")
    the_supervisor.email = params.fetch("query_email")
    the_supervisor.phone = params.fetch("query_phone")
    the_supervisor.conference_number = params.fetch("query_conference_number")

    if the_supervisor.valid?
      the_supervisor.save
      redirect_to("/supervisors/#{the_supervisor.id}", { :notice => "Supervisor updated successfully."} )
    else
      redirect_to("/supervisors/#{the_supervisor.id}", { :alert => the_supervisor.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_supervisor = Supervisor.where({ :id => the_id }).at(0)

    the_supervisor.destroy

    redirect_to("/supervisors", { :notice => "Supervisor deleted successfully."} )
  end
end
