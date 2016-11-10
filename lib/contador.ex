defmodule Contador do
  use GenServer

  def start_link do
     GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, 0}
  end

  def suma do
    GenServer.call(__MODULE__, :suma)
  end

  def resta do
    GenServer.call(__MODULE__, :resta)
  end

  def muestra do
    GenServer.call(__MODULE__, :muestra)
  end

  def handle_call(:suma, _from, contador) when contador < 10 do
    IO.puts "Incremento el #{contador} a #{contador+1}"
    {:reply, contador+1, contador+1}
  end

  def handle_call(:resta, _from, contador) do
    IO.puts "Decremento el #{contador} a #{contador-1}"
    {:reply, contador-1, contador-1}
  end

  def handle_call(:muestra, _from, contador) do
    IO.puts "Contador a #{contador}"
    {:reply, contador, contador}
  end

end
