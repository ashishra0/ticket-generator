require './ticket'

class TicketCounter
  def initialize
    @tickets = []
    100.times do
      @tickets.push Ticket.new
    end
    @tickets
  end

  def all
    @tickets.collect { |t| t }
  end

  def confirmed_tickets
    (@tickets.collect { |t| t if t.status == 'CONFIRMED' }) - [nil]
  end

  def cancelled_tickets
    (@tickets.collect { |t| t if t.status == 'CANCELLED' }) - [nil]
  end

end
