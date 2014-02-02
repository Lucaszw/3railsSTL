class HomeController < ApplicationController
  def index
    if params[:selectedFile] != nil
      @selectedFile = ModelUpload.find(params[:selectedFile])

    else
      @selectedFile = ModelUpload.find(1)
    end
    @allModels = ModelUpload.all
    # render text: @selectedFile.inspect
  end

  def upload
  end

  def save
    modelUpload = ModelUpload.new
    modelUpload.update_attributes(params[:file].permit!)
    modelUpload.save
    render text: params[:file].inspect

  end

  def permit!
    each_pair do |key, value|
      convert_hashes_to_parameters(key, value)
      self[key].permit! if self[key].respond_to? :permit!
    end

    @permitted = true
    self
  end



end
