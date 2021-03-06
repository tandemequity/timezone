defmodule Timezone.Mixfile do
  use Mix.Project

  @version "0.2.2"

  def project do
    [
      app: :timezone,
      version: @version,
      elixir: "~> 1.7",
      name: "Timezone",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Hex
      description: description(),
      package: package(),
      docs: docs()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:httpoison, "~> 1.5.0"},
      {:poison, "~> 3.0 or ~> 3.1 or ~> 4.0"},
      {:decimal, "~> 1.6", optional: true},
      {:ex_doc, "~> 0.19", override: true, only: :dev}
    ]
  end

  defp description do
    """
    Simple wrapper around Google Maps Time Zone API
    """
  end

  defp package do
    [
      name: :timezone,
      maintainers: ["Benjamin Schultzer"],
      licenses: ["MIT"],
      links: links(),
      files: ["lib", "config", "mix.exs", "README*", "CHANGELOG*", "LICENSE*"]
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      extras: ["README.md", "CHANGELOG.md"]
    ]
  end

  defp links do
    %{
      "GitHub" => "https://github.com/schultzer/timezone",
      "Readme" => "https://github.com/schultzer/timezone/blob/v#{@version}/README.md",
      "Changelog" => "https://github.com/schultzer/timezone/blob/v#{@version}/CHANGELOG.md"
    }
  end
end
