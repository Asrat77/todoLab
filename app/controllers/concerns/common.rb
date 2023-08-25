module common
  extend ActiveSupport::Concern

  included do
    before_action: :set_clazz
    before_action: :set_object, only: %i[show update destroy]
  end


  def index
    @obj = @clazz.all
  end

  def show
    render :json
  end

  def create
    @obj = @clazz.new(model_params)

    if obj.save
      render :json, status: :created
    else
      render status: :unprocessable_entity
    end

  end

  def update
    if obj.update(model_params)
      render :json, status: :ok
    else
      render json: @clazz.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @obj.destroy
  end



  private

  def set_clazz
    @clazz = controller_name.classify.constantize
  end

  def set_object
    @obj = @clazz.find(params[:id])
  end

  #override by the child controllers
  def model_params; end


