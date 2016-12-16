# Crawlie (the crawler) [![badge](https://travis-ci.org/nietaki/crawlie.svg?branch=master)](https://travis-ci.org/nietaki/crawlie) [![Coverage Status](https://coveralls.io/repos/github/nietaki/crawlie/badge.svg?branch=master)](https://coveralls.io/github/nietaki/crawlie?branch=master) [![Hex.pm](https://img.shields.io/hexpm/v/crawlie.svg)](https://hex.pm/packages/crawlie) [![docs](https://img.shields.io/badge/docs-hexdocs-yellow.svg)](https://hexdocs.pm/crawlie/)

Crawlie is meant to be a simple Elixir library for writing decently-peforming crawlers with minimum effort. It's a work in progress, it doesn't do much yet.

## Usage example

See the [crawlie_example](https://github.com/nietaki/crawlie_example) project.

## Configuration

`TODO`

## Planned features

`TODO`

## Installation

The package can be installed as:

  1. Add `crawlie` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:crawlie, "~> 0.1.1"}]
    end
    ```

  2. Ensure `crawlie` is started before your application:

    ```elixir
    def application do
      [applications: [:crawlie]]
    end
    ```
