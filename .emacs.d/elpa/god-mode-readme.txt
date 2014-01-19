This library defines the following mapping:

1. All commands are assumed to be C-<something> unless otherwise
   indicated. Examples:
   * a    -> C-a
   * s    -> C-s
   * akny -> C-a C-k C-n C-y
  * `x s`  → `C-x s`

  Note the use of space to produce `C-x s`.

2. `g' is a special key to indicate M-<something>. This means that
   there is no way to write `C-g' in this mode, you must therefore
   type `C-g' directly. Examples:
   * gf -> M-f
   * gx -> M-f

   This key can be configured.

6. There is a convention of uppercase special keys to indicate
   two modifier keys in action. Those are:
   * Gx -> C-M-x

7. There is a literal interpretation key as `l' that can
   be used on chained commands, e.g.

   * xs -> C-x C-s
   * xlb -> C-x b
   * xlh -> C-x h
   * xp -> C-x C-p
   * xx -> C-x C-x

   This key can be configured.

8. There is a key (default `i') to disable God mode, similar to
   Vim's i.
