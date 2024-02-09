class Api::V1::UsersController < ApplicationController
  def current
    render json: {
      status: { code: 200 },
      data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    }
  end
end
