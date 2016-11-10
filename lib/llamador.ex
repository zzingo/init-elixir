defmodule Llamador do
  use GenServer

  def start_link(funcion) do
     GenServer.start_link(__MODULE__, {funcion, 50}, name: __MODULE__)
  end

  def init(params) do
    start_loop
    {:ok, params}
  end

  def start_loop do
    GenServer.cast(__MODULE__, :auto)
  end

  def handle_cast(:auto, params = {funcion, period}) do
    funcion.()
    GenServer.cast(__MODULE__, :auto)
    :timer.sleep(period)
    {:noreply, params}
  end

end
