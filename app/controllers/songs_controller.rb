class SongsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
      if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @songs = Song.where("name LIKE ? OR singer LIKE ? OR genre LIKE ? OR about LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        @songs = Song.all
      end
    end

    def new
        @song = Song.new
    end
    
    def create
      song = Song.new(song_params)

      song.user_id = current_user.id

      if song.save
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

    def hourock
      @hourocks = Song.where(category:"hourock")
    end
  
    def kpop
      @kpops = Song.where(category:"kpop")
    end
  
    def yougakupop
      @yougakupops = Song.where(category:"yougakupop")
    end

    def yougakurock
      @yougakurocks = Song.where(category:"yougakurock")
    end

    def jpop
      @jpops = Song.where(category:"jpop")
    end
  
    def vocaloid
      @vocaloids = Song.where(category:"vocaloid")
    end
  
    def anison
      @anisons = Song.where(category:"anison")
    end

    def classic
      @classics = Song.where(category:"classic")
    end
  
    def hiphop
      @hiphops = Song.where(category:"hiphop")
    end
  
    def randb
      @randbs = Song.where(category:"randb")
    end


    def show
      @song = Song.find(params[:id])
    end

    def edit
      @song = Song.find(params[:id])
    end

    def update
      song = Song.find(params[:id])
      if song.update(song_params)
        redirect_to :action => "show", :id => song.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      song = Song.find(params[:id])
      song.destroy
      redirect_to action: :index
    end
    
    private
    def song_params
      params.require(:song).permit(:name, :genre, :singer, :about, :movie, :user_id, :image, :category, :youtube_url)
    end

end
