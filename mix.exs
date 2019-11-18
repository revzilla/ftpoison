defmodule FTPoison.Mixfile do
  use Mix.Project

  @version "0.1.1"

  def project do
    [app: :ftpoison,
     version: @version,
     elixir: "~> 1.6.6",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     name: "FTPoison",
     deps: deps()]
  end

  defp description do
    """
    Simple Elixir wrapper for the erlang :ftp library.
    """
  end

  defp package do
    [
      maintainers: ["RevZilla", "Tyler Cain", "Steve DeGele"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/revzilla/ftpoison"},
      files: ~w(lib mix.exs README.md CHANGELOG.md)
    ]
  end

  def application do
    [
      extra_applications: [:logger, :ftp]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.18.0", only: :dev, runtime: false}
    ]
  end
end
