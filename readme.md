# Simple Ticket Counter

### Problem Statement

An airline has a “ticket” model where every ticket has a booking number
which is of the form XYZ A2C. The first 3 characters need to be
alphabets(upcase only) and the last 3 can be alphabets (upcase only) or
numbers.

##### Additional conditions :
  - All tickets where the journey date is more than 2 years old can be reissued.
  - All the booking numbers of tickets that have been cancelled, can be used 3 months
after the cancelled date.
  - No booking reference can start with EKA. For example, EKAXY9 cannot be valid.
HoweverAEKA23 will be valid.
  - No booking reference can have any of the 5 user defined words. SELFIE, BARNEY,
RACHEL, MONICA,ETIHAD, AMAZON

Create a program where such booking numbers are generated randomly as soon as a
ticket is booked. They cannot be sequential. They can never be repeated. Program
should show the following:
  - Booking Reference of this ticket.
  - The number of tickets already issued.
  - The number of tickets that can be issued.

### How to use

Clone and Navigate into this repo locally.

Fire up your pry as shown below
```ruby
$ cd # path to repo
$ pry -r ./ticket_counter.rb

[1] pry(main)> ticket_counter = TicketCounter.new(number_of_tickets)
[2] pry(main)> ticket_counter.all
[3] pry(main)> ticket_counter.confirmed_tickets
[4] pry(main)> ticket_counter.cancelled_tickets
[5] pry(main)> ticket_counter.total
[6] pry(main)> ticket_counter.issued
[7] pry(main)> ticket_counter.available
[8] pry(main)> ticket_counter.create_ticket
```
