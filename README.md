# WordPress plugin development git hooks

This is a collection of git hooks to be used in conjunction with git-flow AVH
edition.

It also has some standard git hooks that were originally created by [Sitebase](https://github.com/Sitebase/git-hooks).
I just adjusted their code to make it work for me.

These hooks are used by me for development of WordPress plugins.

## Installation
* Clone the repository
* Install using `make`, by default the software will be installed
in `~/.config/git/wp-plugin/`.
* In project dir run: 'git config --local init.templatedir ~/.config/git/wp-plugin/

* Modify the hooks_config file as needed (set MAINFILE to plugin name)

## Requirements
* git-flow AVH edition
* WordPress meta information is set up as described below.
* The readme.txt contains a Changelog section as described below.
* Bash shell script.
* Use the [Semantic Versioning 2.0.0](http://semver.org/) specification.

## Information

* When you start a release you can omit the version number. The filter will grep
  the version set in the stable info of the master branch and increase the patch level.
* You can't commit on a master branch.
* You can't commit files with merge markers.
* Commit messages shorter than 8 are not allowed.

## hooks_config file
This file has the function for updating the version number in your project. You
need to change the variable MAINFILE to identify the file containing the
mandatory WordPress meta information,

* If you keep track of your version somewhere else than the main file and the
  readme.txt, you need to make these changes in the function _update_version.
* There is no need to change the version for the stable tag in this file. This
  will be taking care of when you finish a release or hotfix.

## WordPress meta information
Unlike the codex describes, I use a different comment system for the meta
information.
```
/**
 * Plugin Name:
 * Plugin URI:
 * Description:
 * Version: 0.0.0
 * Author:
 * Author URI:
 *
*/
```
You can add or remove meta information but you need to keep the Version tag,
with a space behind the colon.

## readme.txt
The readme.txt needs to contain a section for the changelog, set up as follows
```
== Changelog ==

= Version 0.0.0 =
* Start of the changelog
```

After you added another version you can edit or remove the 0.0.0 entry

## License
Portions of the code is licensed as The MIT License

Copyright (c) 2013 Wim Mostmans

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
