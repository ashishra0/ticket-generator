require 'date'
class Ticket
  attr_reader :number, :date, :status
  INVALID = %W(SELFIE BARNEY RACHEL MONICA ETIHAD AMAZON EKAXY9)

  def initialize
    @number = booking_number
    @date = travel_date
    @status = booking_status
  end

  def number
    @number
  end

  def date
    @date
  end

  def status
    @status
  end

  private

  def booking_number
    num = ""
    begin
      num = first_three_chars + last_three_chars
    end while INVALID.include? num
    return num
  end

  def travel_date
    dates = ((Date.today - 365*10)..(Date.today)).to_a.map { |d| d.to_s }
    dates.sample
  end

  def booking_status
    %W(CONFIRMED CANCELLED).sample
  end

  def first_three_chars
    begin
      num = ("A".."Z").to_a.sample(3).join('')
    end while num === "EKA"
    return num
  end

  def last_three_chars
    num = ('A'..'Z').to_a + (0..9).map {|n| n.to_s }
    return num.sample(3).join('')
  end
end
