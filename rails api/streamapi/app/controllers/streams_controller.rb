class StreamsController < ApplicationController 
    def index 
      
        @streams = Stream.all

        render json: @streams
     end

     def show
        @stream = Stream.find(params[:id])
        render json: @stream
    end

    def create
        @stream = Stream.create(stream_params)
        if @stream.valid?
            render json: @stream
        else
            render json: { errors: @stream.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def edit
        @stream = Stream.find(params[:id])
    end

    def update
        @stream = Stream.find(params[:id])
        if @stream.valid?
          @stream.update(stream_params)
            render json: @stream
        else
            render json: { errors: @stream.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy 
        @stream = Stream.find(params[:id])
        @stream.destroy
      if @stream.valid? 
        render json: { errors: @stream.errors.full_messages }
      end
    end
    

    private 

    def stream_params
        params.require(:stream).permit(:title,:description,:user_id)
    end
end