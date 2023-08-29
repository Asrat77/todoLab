module Common
  extend ActiveSupport::Concern

  included do
    before_action :set_clazz
    before_action :set_object, only: %i[show update destroy]
  end


  def index
    data = if block_given?
      yield
      else
    @clazz.all
    end
    render json: {success: true, data: serialize(data)}
  end

  def show
    render json: {success: true, data: serialize(@obj)}
  end

  def create
    obj = if block_given?
            yield
          else
            @clazz.new(model_params)
          end
    if obj.save
      render json: {success: true, data: serialize(obj)}, status: :created
    else
      render json: {success: false, error: obj.errors.full_messages[0]}, status: :unprocessable_entity
    end
    rescue => e
      render json: {success: false, error: e.message}
    end


  def update
    if block_given?
      yield
    else
        obj = @obj
    end
    if obj.update(model_params)
      render json: {success: true, data: serialize(obj)}, status: :ok
    else
      render json: {error: obj.errors, success: false}, status: :unprocessable_entity
    end
    rescue => e
      render json: {success: false, error: e.message}
  end

  def destroy
    @obj.destroy
  end

  private

  def serialize(data)
    ActiveModelSerializers::SerializableResource.new(data)
  end


  def set_clazz
    @clazz = controller_name.classify.constantize
  end

  def set_object
    @obj = @clazz.find(params[:id])
  end

  #override by the child controllers
  def model_params; end

end
