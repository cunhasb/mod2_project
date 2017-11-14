class LabelController < ApplicationController





  private

  def label_params
    params.require(:label).permit(:name)
  end

end
