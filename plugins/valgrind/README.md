ceedling-valgrind
=================

Plugin for easily calling valgrind during the testing process.

First, add this plugin to your list of plugins:

```
:plugins:
  :enabled:
    - valgrind
```

Then you can optionally add a valgrind section to your project.yml file in order to further select
the options. You may stick with the default options if you like.

```
:valgrind:
  :track_origins: true
  :leak_check: :full
  :show_leak_kinds: :all
  :errors_for_leaks: :all
  :error_exitcode: 10
```

Happy Testing!
