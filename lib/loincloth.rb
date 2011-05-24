class Loincloth

  def initialize(str)
    @str = str
  end

  def blocks
    @str.split(/[\n\r][\n\r]+/)
  end

end
