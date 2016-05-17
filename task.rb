require "date"

class Task < Post

  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts "What to do?"
    @text = STDIN.gets.chomp

    puts "Due date?"
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Created: #{@created_at.strftime("%Y-%m-%d_%H-%M-%S.txt")} \n\r \n\r"

    deadline = "Deadline: #{@due_date}"

    return [deadline, @text, time_string]
  end

end