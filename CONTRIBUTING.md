# Contributing

This project does not accept contributions at this time.

These notes are for my own reference.

## Local development

The "Running your plugin locally" section of the 
[How to write a Bundler plugin][1] instructions seems to be wrong, per 
https://github.com/rubygems/rubygems/issues/3209#issuecomment-652107633

However, `--git` seems to work. So, I open two tabs, one in the bundler-why
directory, the second in some project `banana` with a meaningful gemfile.

To test a change, in the first tab I make a WIP commit then in the second tab I

```
rm -rf /Users/jared/git/banana/.bundle/plugin
bundler plugin install bundler-why \
  --git file:///Users/jared/git/bundler-why --branch trunk \
  --verbose --retry=1
bundle why tzinfo
```

Deleting the `plugin` directory is a workaround for the fact that [bundler
does not provide a command to uninstall plugins][2].

[1]: https://bundler.io/v2.0/guides/bundler_plugins.html
[2]: https://github.com/rubygems/rubygems/issues/3187
