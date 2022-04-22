defmodule Hookex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Hookex.Repo,
      # Start the Telemetry supervisor
      HookexWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hookex.PubSub},
      # Start the Endpoint (http/https)
      HookexWeb.Endpoint
      # Start a worker by calling: Hookex.Worker.start_link(arg)
      # {Hookex.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hookex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HookexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
