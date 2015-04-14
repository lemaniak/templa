class APIController < ApplicationController

  ActionController::Parameters.action_on_unpermitted_parameters = :raise

  rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
    response = {message:"parameter "+ parameter_missing_exception.to_s}
    respond_to do |format|
      format.json { render json: response, status: :bad_request}
    end
  end

  rescue_from(ActionController::UnpermittedParameters) do |non_permited_parameter_exception|
    response = {message:non_permited_parameter_exception.to_s}
    respond_to do |format|
      format.json { render json: response, status: :bad_request}
    end
  end

  rescue_from(ActiveRecord::RecordNotFound) do
    response = {message:"entity not found"};
    respond_to do |format|
      format.json { render json: response, status: :bad_request}
    end
  end

end