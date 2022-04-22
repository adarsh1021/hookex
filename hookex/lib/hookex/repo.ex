defmodule Hookex.Repo do
  use Ecto.Repo,
    otp_app: :hookex,
    adapter: Ecto.Adapters.Postgres
end
