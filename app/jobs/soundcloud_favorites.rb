require 'logger'

class SoundcloudFavorites
  @queue = :soundcloud_favorites

  def self.perform(options = {})
    log.info "Creating Soundcloud favorites for #{options["user_id"]}"
    SoundcloudFavorite.update_favorites_for_user(options["user_id"])
    log.info "Completed creating Soundcloud favorites for #{options["user_id"]}"
  end

  def self.log
    @logger ||= Logger.new(STDOUT)
  end
end
