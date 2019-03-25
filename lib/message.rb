# Class Message for handling messages
class Message
  def initialize(message, player = nil)
    @messages = {
      instruction: 'Insert field to play.',
      turn: "Player #{player}: ",
      no_field: 'The field does not exist.',
      not_empty: 'The field is not empty',
      tie: 'Game over. We have no winner.',
      winner: "Game over. The winner is Player #{player}."
    }

    puts @messages[message]
  end
end
