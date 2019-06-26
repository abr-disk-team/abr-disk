class LabelsController < ApplicationController

    before_action :authenticate_user!
    def new
        @label = Label.new
        unless user_signed_in? && current_user.admin
            redirect_to items_path
        end
    end

    def create
        label = Label.new(label_params)
        label.save
        redirect_to new_label_path
    end

    def edit
        @label = Label.find(params[:id])
        unless user_signed_in? && current_user.admin
            redirect_to items_path
        end
    end

    def update
        @label = Label.find(params[:id])
        @label.update(label_params)
        redirect_to new_label_path
    end

    def destroy
        @label = Label.find(params[:id])
        @label.destroy
        redirect_to new_label_path
    end

    private

    def label_params
        params.require(:label).permit(:label)
    end
end
