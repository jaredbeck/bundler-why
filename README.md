# Bundler::Why

Explains the presence of a dependency.

```bash
bundle why tzinfo
ransack -> activesupport -> tzinfo
rspec-rails -> activesupport -> tzinfo
business_time -> tzinfo
...
```

## License

[Do No Harm License](LICENSE.md)

By using this software you accept the terms of the license.

## Installation

```bash
bundler plugin install bundler-why
```

## Usage

Specify the name of one gem. There are no options.

## Contributing

This project does not accept contributions at this time.

## Graphs are the coolest

If you like [graphs][1], you'll enjoy knowing that Bundler uses a [directed
acyclic graph][2] and `why` is printing all [directed paths][3] to the specified
gem.

## Inspired by

[`yarn why`][4]

[1]: https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)
[2]: https://en.wikipedia.org/wiki/Directed_acyclic_graph
[3]: https://en.wikipedia.org/wiki/Path_(graph_theory)
[4]: https://classic.yarnpkg.com/en/docs/cli/why
