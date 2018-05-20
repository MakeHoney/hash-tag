class HashtagsController < ApplicationController
  def show
    hashId = params[:id];
    @Hashtag = Hashtag.find(hashId);
    @clubIdsForEachHash = Hashtag.find(hashId).club_ids.uniq
  end
end
