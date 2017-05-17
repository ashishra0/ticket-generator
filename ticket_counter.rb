require './ticket'

class TicketCounter
  def initialize
    @tickets = []
    500.times do
      ticket = Ticket.new
      redo if (confirmed_tickets.map { |t| t.number }).include? ticket.number
      @tickets.push ticket
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

  def total
    total = ('A'..'Z').count ** 3 * (('A'..'Z').count + (0..9).count) ** 3
    last_three_count = (('A'..'Z').count + (0..9).count) ** 3
    invalid_count = Ticket::INVALID.count
    total - (last_three_count + invalid_count)
  end

  def issued
    all.count
  end

  def available
    total - issued - cancelled_tickets.count
  end

end
