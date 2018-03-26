atom_feed do |feed|
  feed.title "Last discoveries"
  feed.updated @games.maximum(:updated_at)
  
    @games.each do |game|
      feed.entry game do |entry|
        entry.link href:game.photos[0].image.url(:thumb), rel:"enclosure", type:"image/jpeg"
        entry.title game.game_name
        entry.description game.game_description
        entry.external_link game.game_external_link
      end
    end
end