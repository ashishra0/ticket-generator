require './ticket'

class TicketCounter
  def initialize(number_of_tickets)
    @tickets = []
    number_of_tickets.times do
      ticket = Ticket.new(nil, nil)
      redo if (confirmed_tickets.map { |t| t.number }).include? ticket.number
      @tickets.push ticket
    end
    @tickets
  end

  def all
    @tickets.collect { |t| t }
  end

  def confirmed_tickets
    @tickets.select { |t| t if t.status == 'CONFIRMED' }
  end

  def cancelled_tickets
    @tickets.select { |t| t if t.status == 'CANCELLED' }
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
    total - issued
  end

  def create_ticket
    ticket = Ticket.new('CONFIRMED', Date.today.to_s) do
      redo if (confirmed_tickets.map { |t| t.number }).include? ticket.number
      redo if (cancelled_tickets.map { |t| t.number if t.date > (Date.today - 90).to_s }).include? ticket.number
      redo if (all.map { |t| t.number if t.date > (Date.today - 730).to_s }).include? ticket.number
    end
    @tickets.push ticket
    return ticket
  end

end
