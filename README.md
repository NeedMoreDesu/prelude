[![License GPL 3][badge-license]](http://www.gnu.org/licenses/gpl-3.0.txt)

Emacs Prelude FORK -- personal configuration
=============

This is a fork of [Emacs Prelude](https://github.com/bbatsov/prelude) with my custom configurations. I'm a mac user, so *some* configurations are mac-oriented.

## How do I use it?

It have been configured to be used as easy setup method. Clone this repository to ~/.emacs.d/ folder -- it is the place where emacs stores it's configurations, and download emacs 25+ from anywhere.

Some libraries might not be here(should be fixed in latest commits), so install them with `M-x package-install`.

# What did I do:

File `~/.emacs.d/personal/preload/disable-modes.el`

``` emacs-lisp
(defmacro kill-with-fire (&rest worthless-modes)
  (if worthless-modes
    `(progn (advice-add #',(car worthless-modes) :before-until (lambda (&rest args) t))
       (kill-with-fire ,@(cdr worthless-modes)))))

;; Not smart. Buggy as hell. Don't allow me to delete parens.
(kill-with-fire smartparens-mode smartparens-strict-mode)
;; Plz shutup I know what I'm doing.
(kill-with-fire guru-mode guru-global-mode)
;; Buggy, breaks buffers with ease
(kill-with-fire global-undo-tree-mode undo-tree-mode)
;; Plz no, I want my arrow navigation
(kill-with-fire windmove-default-keybindings)
```

Uhh, self-explanatory.

## Directory structure

```
  ~/.emacs.d/personal:
  total used in directory 40 available 4292517771
  -rw-r--r--   1 divnuy  staff  2301 Nov  9 22:18 keybinding.el
// Is the only file where custom keybindings go.
// Do note that most keybindings use `hyper` key.
  -rw-r--r--   1 divnuy  staff    12 Dec  7 17:56 last-actions.el
// Actions to perform after scripts are loaded  
  -rw-r--r--   1 divnuy  staff  1374 Nov  9 22:23 other.el
// It is my set of preferences.
  -rw-r--r--   1 divnuy  staff   685 Nov  1 13:55 parentheses.el
// Parentheses libraries with colorscheme configurations.
// It's here and not in **provide** because it actually changes something,
// not just providing new commands.
  drwxr-xr-x  12 divnuy  staff   408 Nov  9 22:36 provide
// Is a directory where custom libraries live (they can be `require`d from there)
```

## My custom libraries

```
~/.emacs.d/personal/provide:
  total used in directory 96 available 4292517774
  -rw-r--r--   1 divnuy  staff   944 Dec 18 17:26 add-quote.el
// Allows to insert same characters at the beginning of each line
  -rw-r--r--   1 divnuy  staff  1287 Nov  2 00:28 close-open-paren.el
// Commands to put closing parens at current point,
// guessing the paren by context.
// I don't like electrical parens, and this is a solution.
  -rwxr-xr-x   1 divnuy  staff  2971 Dec 25  2014 cmnuminc.el
// Commands that allow to calculate current line (or from prompt),
// inserting it in calc and getting back results immediately.
// Much more useful than calc itself.
  -rw-r--r--   1 divnuy  staff  1667 Nov  9 21:22 comment-toggle.el
// I sorta tried to make it work like in Xcode, but.. well.
// When no region, it comments/uncomments current line,
// when there is region - it uncomments region while it can,
// and if it can't - comments. It comments whole lines.
// If you don't want to uncomment region, use any ARG.
  -rw-r--r--   1 divnuy  staff   126 Nov  9 19:59 full-indent.el
// Indent whole buffer.
  -rwxr-xr-x   1 divnuy  staff  6931 Jul 16  2014 ido-preview.el
// Allows to preview stuff that [IDO](http://www.emacswiki.org/emacs/InteractivelyDoThings)
// can show with `C-n` and `C-p`.
  -rw-r--r--   1 divnuy  staff   195 Nov  1 22:14 macos-related.el
// Self-explanatory.
  -rw-r--r--   1 divnuy  staff   750 Nov  9 22:04 main-buffer.el
// Allow to concentrate on file you are working with,
// jumping back to it and full-screening.
  -rwxr-xr-x   1 divnuy  staff  5282 Jul 16  2014 noflet.el
// Not mine, just using it :)
  -rw-r--r--   1 divnuy  staff   663 Nov  1 18:05 toggle-spacing.el
// Toggle spacing with `C-z`. It deletes any whitespace at point,
// and inserts " ", "\n", "\n\n", "" (press again to cycle).
  -rwxr-xr-x   1 divnuy  staff   637 Nov  1 14:32 try-keys.el
// Did you ever enter some mode and don't know anything about what
// commands it have? This mode allows you to press any button to
// just call button-description function. `C-g` to quit.
```

# Cheers :)

[badge-license]: https://img.shields.io/badge/license-GPL_3-green.svg
