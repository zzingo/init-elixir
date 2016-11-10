defmodule ElixirLogs do
  use Application

  def start(_start_type, _start_args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Contador, []),
      worker(Llamador, [&Contador.suma/0])
    ]
    opts = [
      strategy: :one_for_one,
      name: ElixirLogs.Supervisor,
      max_restarts: 10,
      max_seconds: 10
    ]
    Supervisor.start_link(children, opts)
  end

end
