
class TeutonShell
  def initialize
    @prompt = 'teuton-shell> '
  end

  def run
    cmd = ''
    while(cmd!='quit')
      print @prompt
      cmd = gets.chop
      system(cmd)
    end
  end
end
