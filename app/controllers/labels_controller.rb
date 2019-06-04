class LabelsController < ApplicationController


    def new
        @label = Label.new
    end

    def create
        label = Label.new(params_label)
        label.save
        redirect_to new_label_path
    end

    def edit
        @label = Label.find(params[:id])
    end

    def update
        @label = Label.find(params[:id])
        @label.update(params_label)
        redirect_to new_label_path
    end

    def destroy
        @label = Label.find(params[:id])
        @label.destroy
        redirect_to new_label_path
    end

    private

    def params_label
        params.require(:label).permit(:label)
    end
end
