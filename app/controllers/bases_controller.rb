class BasesController < ApplicationController
  def index
    matching_bases = Basis.all

    @list_of_bases = matching_bases.order({ :created_at => :desc })

    render({ :template => "bases/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bases = Basis.where({ :id => the_id })

    @the_basis = matching_bases.at(0)

    render({ :template => "bases/show" })
  end

  def create
    the_basis = Basis.new
    the_basis.base = params.fetch("query_base")
    the_basis.cobase = params.fetch("query_cobase", false)

    if the_basis.valid?
      the_basis.save
      redirect_to("/bases", { :notice => "Basis created successfully." })
    else
      redirect_to("/bases", { :alert => the_basis.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_basis = Basis.where({ :id => the_id }).at(0)

    the_basis.base = params.fetch("query_base")
    the_basis.cobase = params.fetch("query_cobase", false)

    if the_basis.valid?
      the_basis.save
      redirect_to("/bases/#{the_basis.id}", { :notice => "Basis updated successfully."} )
    else
      redirect_to("/bases/#{the_basis.id}", { :alert => the_basis.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_basis = Basis.where({ :id => the_id }).at(0)

    the_basis.destroy

    redirect_to("/bases", { :notice => "Basis deleted successfully."} )
  end
end
