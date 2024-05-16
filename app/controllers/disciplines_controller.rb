class DisciplinesController < ApplicationController
  require 'rest-client'
  def index
    matching_disciplines = Discipline.all

    @list_of_disciplines = matching_disciplines.order({ :created_at => :desc })

    render({ :template => "disciplines/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_disciplines = Discipline.where({ :id => the_id })

    @the_discipline = matching_disciplines.at(0)

    render({ :template => "disciplines/show" })
  end

  def create
    mg_api_key = ENV.fetch("MAILGUN")
    mg_sending_domain = "@api.mailgun.net/v3/far/messages"
    mg_client = Mailgun::Client.new(mg_api_key)

    the_discipline = Discipline.new
    the_discipline.emp_id = params.fetch("query_emp_id")
    the_discipline.sup_id = params.fetch("query_sup_id")
    the_discipline.level = params.fetch("query_level")
    the_discipline.effective = params.fetch("query_effective")
    the_discipline.expires = params.fetch("query_expires")
    the_discipline.reason = params.fetch("query_reason")
    the_discipline.expectations = params.fetch("query_expectations")

    if the_discipline.valid?
      the_discipline.save
      email_info =  { 
        :from => "umbrella@appdevproject.com",
        :to => "dmoskowitz815@gmail.com",  # Put your own email address here if you want to see it in action
        :subject => "Take an umbrella today!",
        :text => "It's going to rain today, take an umbrella with you!"
      }
      mg_client.send_message(mg_sending_domain, email_info)
      
      redirect_to("/users/#{the_discipline.emp_id}", { :notice => "Discipline created successfully." })
    else
      redirect_to("/disciplines", { :alert => the_discipline.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_discipline = Discipline.where({ :id => the_id }).at(0)

    the_discipline.emp_id = params.fetch("query_emp_id")
    the_discipline.sup_id = params.fetch("query_sup_id")
    the_discipline.level = params.fetch("query_level")
    the_discipline.effective = params.fetch("query_effective")
    the_discipline.expires = params.fetch("query_expires")
    the_discipline.reason = params.fetch("query_reason")
    the_discipline.expectations = params.fetch("query_expectations")

    if the_discipline.valid?
      the_discipline.save
      redirect_to("/disciplines/#{the_discipline.id}", { :notice => "Discipline updated successfully."} )
    else
      redirect_to("/disciplines/#{the_discipline.id}", { :alert => the_discipline.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_discipline = Discipline.where({ :id => the_id }).at(0)

    the_discipline.destroy

    redirect_to("/disciplines", { :notice => "Discipline deleted successfully."} )
  end
end