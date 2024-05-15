class TemplatesController < ApplicationController
  def index
    matching_templates = Template.all

    @list_of_templates = matching_templates.order({ :created_at => :desc })

    render({ :template => "templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_templates = Template.where({ :id => the_id })

    @the_template = matching_templates.at(0)

    render({ :template => "templates/show" })
  end

  def create
    the_template = Template.new
    the_template.title = params.fetch("query_title")
    the_template.reason = params.fetch("query_reason")
    the_template.expectations = params.fetch("query_expectations")

    if the_template.valid?
      the_template.save
      redirect_to("/templates", { :notice => "Template created successfully." })
    else
      redirect_to("/templates", { :alert => the_template.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_template = Template.where({ :id => the_id }).at(0)

    the_template.title = params.fetch("query_title")
    the_template.reason = params.fetch("query_reason")
    the_template.expectations = params.fetch("query_expectations")

    if the_template.valid?
      the_template.save
      redirect_to("/templates/#{the_template.id}", { :notice => "Template updated successfully."} )
    else
      redirect_to("/templates/#{the_template.id}", { :alert => the_template.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_template = Template.where({ :id => the_id }).at(0)

    the_template.destroy

    redirect_to("/templates", { :notice => "Template deleted successfully."} )
  end
end
