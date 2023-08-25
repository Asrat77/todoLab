class TodosController < ApplicationController
  include Common

  private
    # Only allow a list of trusted parameters through.
    def model_params
      params.require(:payload).permit(:title, :status, :date)
    end
end
