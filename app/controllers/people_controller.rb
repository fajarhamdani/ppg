class PeopleController < BaseController
  load_and_authorize_resource

  before_action :validate_params, only: :index
  before_action :collect_people, only: :index
  before_action :get_person, only: [:edit, :update, :destroy]

  def index; end

  def new
    @person = Person.new
  end

  def edit; end

  def update; end

  def destroy
    person_name = @person.fullname

    if @person.delete
      flash[:notice] = "Data #{person_name} berhasil dihapus"

      redirect_to people_path(category: params[:category])
    end
  end

  private

  def validate_params
    redirect_to root_path unless params[:category].present?
  end

  def collect_people
    @people = case params[:category]
      when 'caberawit'
        Person.caberawits
      when 'praremaja'
        Person.praremajas
      when 'remaja'
        Person.remajas
      when 'dewasa'
        Person.dewasas
      end
  end

  def get_person
    @person = Person.find_by(id: params[:id])

    redirect_to root_path(alert: 'Data generus tidak ditemukan') unless @person.present?
  end
end
