#TimeValidationsExceptions

class InvalidTimeError < Exception
end

class NegativeTimeError < InvalidTimeError
  def initialize()
    super("El tiempo ingresado no puede ser negativo")
  end
end

class EmptyTimeError < InvalidTimeError
  def initialize()
    super("El tiempo ingresado no puede ser vacio")
  end
end

class NotAnIntegerTimeError < InvalidTimeError
  def initialize()
    super("El tiempo ingresado debe ser un numero entero")
  end
end