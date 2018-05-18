class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json

  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end


    # new.html.erb로부터 전달받은 해시태그 스트링을 파싱하여 해시태그 테이블에 넣는다.
    # Hashtag = ApplicationRecord::Hashtag
    # 파싱
    hashtags = params[:hashTags].split(",");

    hashtags.each do |hashtag|
      # 해시태그가 테이블에 이미 존재하면 해시태그를 추가하지 않고 존재하는 해시태그의
      # id를 전달받아 join table에 두 foreign key 저장
      if(Hashtag.exists?(hashtag: hashtag))
        tmpHashtagId = Hashtag.where(hashtag: hashtag)[0]['id'];
        Club.find(@club['id']).hashtags << Hashtag.find(tmpHashtagId);
      # 해시태그가 테이블에 존재하지 않으면 해시태그를 테이블에 추가한 뒤
      # 추가한 해시태그의 id를 전달받아 join table에 두 foreign key 저장
      else
        hashNew = Hashtag.new();
        hashNew['hashtag'] = hashtag;
        hashNew.save;

        Club.find(@club['id']).hashtags << Hashtag.find(hashNew['id']);
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :desc)
    end
end
