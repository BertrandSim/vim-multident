
Ever tried to indent a line twice? `2>>` would give an unexpected result, indenting two lines once instead.
Vim-multident makes `>` work as intended.

With vim-multident, 
to indent the current line twice, type `2>>`.
Similar to native vim, the operator `>` is used with a motion. 
For example, to indent three lines twice, type 

```
2>3_
```

This can also be applied to text-objects. For example, 

     ```
     2>ip
     ```

indents the current paragraph twice.

To dedent (unindent), use `<`. This functions in the same way as `>`.
