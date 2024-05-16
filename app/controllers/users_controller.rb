class UsersController < ApplicationController
  def index

    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @list_of_users = User.where("emp_id LIKE ? OR first_name LIKE ? OR last_name LIKE ?", search_term, search_term, search_term)
    else
      @list_of_users = User.all
    end


    render({ :template => "users/index" })
  end

  def show
    the_id = params.fetch("path_id")
    today = Date.today

    matching_users = User.where({ :emp_id => the_id })

    @the_user = matching_users.at(0)

    matching_disciplines = Discipline.where({ :emp_id => the_id }).where('expires >= ?', today)
    matching_disciplines_exp = Discipline.where({ :emp_id => the_id }).where('expires < ?', today)
    @list_of_disciplines = matching_disciplines.order({ :created_at => :desc })
    @list_of_disciplines_exp = matching_disciplines_exp.order({ :created_at => :desc })

    render({ :template => "users/show" })
  end

  def create
    the_user = User.new
    the_user.sup_id = params.fetch("query_sup_id")
    the_user.first_name = params.fetch("query_first_name")
    the_user.last_name = params.fetch("query_last_name")
    the_user.email = params.fetch("query_email")
    the_user.phone = params.fetch("query_phone")
    the_user.conference_number = params.fetch("query_conference_number")

    if the_user.valid?
      the_user.save
      redirect_to("/users", { :notice => "user created successfully." })
    else
      redirect_to("/users", { :alert => the_user.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user = User.where({ :id => the_id }).at(0)

    the_user.emp_id = params.fetch("query_emp_id")
    the_user.first_name = params.fetch("query_first_name")
    the_user.last_name = params.fetch("query_last_name")
    the_user.email = params.fetch("query_email")
    the_user.phone = params.fetch("query_phone")
    the_user.base = params.fetch("query_base")
    the_user.doh = params.fetch("query_doh")
    the_user.image = params.fetch("query_image")

    if the_user.valid?
      the_user.save
      redirect_to("/users/#{the_user.id}", { :notice => "user updated successfully."} )
    else
      redirect_to("/users/#{the_user.id}", { :alert => the_user.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user = User.where({ :id => the_id }).at(0)

    the_user.destroy

    redirect_to("/users", { :notice => "user deleted successfully."} )
  end
end
