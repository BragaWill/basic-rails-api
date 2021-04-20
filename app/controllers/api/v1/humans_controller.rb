class Api::V1::HumansController < Api::V1::ApiController
  before_action :set_human, only: [:show, :update, :destroy]

  before_action :require_authorization!, only: [:show, :update, :destroy]

  # GET /api/v1/humans

  def index

  @humans = current_user.humans

  render json: @humans

  end

  # GET /api/v1/humans/1

  def show

  render json: @human

  end

  # POST /api/v1/humans

  def create

  @human = Human.new(human_params.merge(user: current_user))

  if @human.save

   render json: @human, status: :created

  else

   render json: @human.errors, status: :unprocessable_entity

  end

  end

  # PATCH/PUT /api/v1/humans/1

  def update

  if @human.update(human_params)

   render json: @human

  else

   render json: @human.errors, status: :unprocessable_entity

  end

  end

  # DELETE /api/v1/humans/1

  def destroy

  @human.destroy

  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_human

   @human = Human.find(params[:id])

  end

  # Only allow a trusted parameter "white list" through.

  def human_params

   params.require(:Human).permit(:name, :cpf, :birth)

  end

  def require_authorization!

   unless current_user == @human.user

     render json: {}, status: :forbidden

   end

  end
end