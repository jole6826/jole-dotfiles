README for Dotfiles
==================

Dotfiles to manage my system setup. So far it contains my vim configuration and
plugins. 

Manage these dotfiles using [dotfiles](https://github.com/jbernard/dotfiles).

Installation
------------

    $ pip install dotfiles

Interface
---------

``-a, --add <file...>``
    Add dotfile(s) to the repository.

``-c, --check``
    Check for missing or unsynced dotfiles.

``-l, --list``
    List currently managed dotfiles, one per line.

``-r, --remove <file...>``
    Remove dotfile(s) from the repository.

``-s, --sync [file...]``
    Update dotfile symlinks. You can overwrite colliding files
    with ``-f`` or
    ``--force``.  All dotfiles are assumed if you do not
    specify any files to
    this command.

``-m, --move <path>``
    Move dotfiles repository to another location,
    updating all symlinks in the
    process.

Examples 
--------

To add '~/.vimrc' to your repository:

    $ dotfile --add ~/.vimrc

To make it available to all your hosts:
    
    $ cd ~/Dotfiles
    $ git add vimrc
    $ git commit -m "Added vimrc, welcome!"
    $ git push

To then use it on a different system, first install Dotfiles and then:

    $ git clone https://github.com/jole6826/jole-dotfiles Dotfiles
    $ dotfiles --sync
