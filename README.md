[![License GPL 3][badge-license]](http://www.gnu.org/licenses/gpl-3.0.txt)

Emacs Prelude FORK -- personal configuration
=============

This is a fork of [Emacs Prelude](https://github.com/bbatsov/prelude) with my custom configurations. I'm a mac user, so *some* configurations are mac-oriented.

Some libraries might not be here, so install them with `M-x package-install`.

## What did I do:

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

```
  ~/.emacs.d/personal:
  total used in directory 40 available 4292517771
  -rw-r--r--   1 divnuy  staff  2301 Nov  9 22:18 keybinding.el
  -rw-r--r--   1 divnuy  staff  1374 Nov  9 22:23 other.el
  -rw-r--r--   1 divnuy  staff   685 Nov  1 13:55 parentheses.el
  drwxr-xr-x  12 divnuy  staff   408 Nov  9 22:36 provide
```

`provide` is a directory where custom libraries live (they can be `require`d from there)

`other.el` is my set of preferences.

`keybinding.el` is the only file where custom keybindings are. My libraries don't do keybindings on their own, but rather `require`d here and bound.

Do note that most keybindings use `hyper` key.

```
~/.emacs.d/personal/provide:
  total used in directory 96 available 4292517774
  drwxr-xr-x  12 divnuy  staff   408 Nov  9 22:04 .
  drwxr-xr-x  10 divnuy  staff   340 Nov  9 22:23 ..
  -rw-r--r--   1 divnuy  staff  1287 Nov  2 00:28 close-open-paren.el
  -rwxr-xr-x   1 divnuy  staff  2971 Dec 25  2014 cmnuminc.el
  -rw-r--r--   1 divnuy  staff  1667 Nov  9 21:22 comment-toggle.el
  -rw-r--r--   1 divnuy  staff   126 Nov  9 19:59 full-indent.el
  -rwxr-xr-x   1 divnuy  staff  6931 Jul 16  2014 ido-preview.el
  -rw-r--r--   1 divnuy  staff   195 Nov  1 22:14 macos-related.el
  -rw-r--r--   1 divnuy  staff   750 Nov  9 22:04 main-buffer.el
  -rwxr-xr-x   1 divnuy  staff  5282 Jul 16  2014 noflet.el
  -rw-r--r--   1 divnuy  staff   663 Nov  1 18:05 toggle-spacing.el
  -rwxr-xr-x   1 divnuy  staff   637 Nov  1 14:32 try-keys.el
```

Now, let's give a brief description of every file. I didn't bother with docs cuz those plugins aren't big.

### close-open-paren.el

Commands to put closing parens at current point, guessing the paren by context. I don't like electrical parens, and this is a solution.

### cmnuminc.el

Commands that allow to calculate current line (or from prompt), inserting it in calc and getting back results immediately. Much more useful than calc itself.

### comment-toggle.el

I sorta tried to make it work like in Xcode, but.. well. When no region, it comments/uncomments current line, when there is region - it uncomments region while it can, and if it can't - comments. It comments whole lines. If you don't want to uncomment region, use any ARG.

### full-indent.el

Pretty much self explanatory.

### ido-preview.el

Allows to preview stuff that [IDO](http://www.emacswiki.org/emacs/InteractivelyDoThings) can show with `C-n` and `C-p`.

### macos-related.el

Self-explanatory.

### main-buffer.el

Allow to concentrate on file you are working with, jumping back to it and full-screening.

### noflet.el

Not mine, just using it :)

### toggle-spacing.el

Toggle spacing with `C-z`. It deletes any whitespace at point, and inserts " ", "\n", "\n\n", "" (press again to cycle).

### try-keys.el

Did you ever enter some mode and don't know anything about what commands it have? This mode allows you to press any button to just call button-description function. `C-g` to quit.
