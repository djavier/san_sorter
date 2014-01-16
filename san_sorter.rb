class SanSorter

  def initialize participants
    @participants = participants
    @order = []
    self
  end

  def print_results
    raise 'Dafuq ur trying to do, run the draft first' if @order.empty?
    puts " ------------------------------"
    puts " | #{'Number'.center(8)} | #{'Buddy'.to_s.center(15)} |"
    puts " ------------------------------"
    @order.each_with_index do |item, index|
      puts " | #{(index+1).to_s.center(8)} | #{(item).to_s.center(15)} |"
    end
    puts " ------------------------------"

    puts "\n Brought you by 'M@rcus Mercedes'"
  end

  def do_work
    raise 'Dafuq ur trying to do, give me some participants to play with' if @participants.empty?
    while @participants.count > 0 do
      pick_and_clean
    end
    self
  end

  private

  def clean_participants
    @participants.delete_if {|key, value| value == 0 }
  end

  def pick_one
    picked_number = Random.rand(@participants.count)
    key_picked = @participants.keys[picked_number]
    @participants[key_picked] -= 1
    @order.push key_picked
  end

  def pick_and_clean
    pick_one
    clean_participants
  end

end