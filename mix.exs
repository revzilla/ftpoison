defmodule FTPoison.Mixfile do
  use Mix.Project

  @version "0.2.0"

  def project do
    [
      app: :ftpoison,
      version: @version,
      elixir: "~> 1.11",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      name: "FTPoison",
      deps: deps(),
      dialyzer: [
        plt_add_deps: :transitive,
        plt_add_apps: [:mix]
      ]
    ]
  end

  defp description do
    """
    Simple Elixir wrapper for the erlang :ftp library.
    """
  end

  defp package do
    [
      maintainers: ["RevZilla", "Tyler Cain", "Steve DeGele", "Jan Gromko"],
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
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0.0-rc.7", only: [:dev, :test], runtime: false}
    ]
  end
end
