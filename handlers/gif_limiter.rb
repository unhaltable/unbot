module Lita
  module Handlers
    class GifLimiter < Handler
      route(/^echo\s+(.+)/, command: true, help: {
        :'echo TEXT' => 'Replies back with TEXT.'
      }) do |response|
        response.reply response.message
      end
    end

    Lita.register_handler(GifLimiter)
  end
end
