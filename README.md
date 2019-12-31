## Introduction

Ever tried to indent a line multiple times?   
If you thought `2>>` indents the current line 2 times, you would be in for a surprise
--- two lines would be indented only once.  

Vim-multindent modifies the behaviour of `>` with a count, and makes it work as 
		indented.

## Usage

With vim-multindent, indent the current line twice with 

```
2>>  
```

Like vanilla vim, the operator `>` is used with a motion.   
For example, to indent the current line and the next three lines twice, type 

```
2>3j
```

Text-objects can also be used. For example, 

```
3>ip
```

indents the current paragraph three times.

In general, indent with

```
[count]>{motion}
```

To dedent (unindent), use `<`. This functions in the same way as `>`.
