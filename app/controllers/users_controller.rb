class UsersController < ApplicationController
    def show
        member = User.find(params[:id])
        @name = member.name
        @infos = member.infos.order(created_at: "DESC")
    end
end
