# Varan's Simple Pseudocode for Typst

This is meant to be an easy to modify basis for anyone who needs to write pseudocode in Typst.

It is not battle-tested, I just needed some way to write pseudocode and this is what I came up with.

## Features:

- Automatic numbering
- Automatic indentation
- Basic multilanguage support
- Commands to reference it

## How to use:

### Include

Copy your "vspct.typ" file into your project directory, and include it using:

```
#import "vspct.typ": *
```

### Set the language

In the "vspct.typ" file you can set the lang variable. The currently supported languages are: English (en) and Hungarian (hu).

```
#let lang = "en"
```

### Base

Your algorithm should be written inside a #pseudo function.

```
#pseudo(caption: "Title of algorithm")[
  Code \
]
```

Each row has to be terminated with a '\' character in order to start a new row.

### Variable assignment (with long left arrow):

```
#pseudo(caption: "Assignment")[
  i #gets 5 \
  a #gets 4
]
```

### I/O

We use the following functions for input and output.

```
#pseudo(caption: "I/O")[
  #pin($i$) \
  #pout($i+1$)
]
```

### If

Since we don't want any collision with the already defined codewords almost every function is prefixed with a 'p'

The usage of the simple if structure is the following:

```
#pseudo(caption: "Simple if")[
  #pif($i % 3 < 2$)[
    a #gets 0
  ]
]
```

You can also do an if-else sturcture

```
#pseudo(caption: "Simple if-else")[
  #pifelse($i % 3 < 2$)[
    a #gets 0
  ][
    a #gets 1
  ]
]
```

### While

Similarly to if we can do the following:

```
#pseudo(caption: "Simple while")[
  i #gets 0 \
  #pwhile($i < 10$)[
    #pout($i$) \
    $i gets i + 1$
  ]
]
```

### Repeat until

```
#pseudo(caption: "Simple while")[
  i #gets 0 \
  #prepeat($i = 10$)[
    #pout($i$) \
    $i gets i + 1$
  ]
]
```

### For each number in range

```
#pseudo(caption: "For each number between 1 and 10 ascending order")[
  #pfor($i$, "1", "10")[
    #pout($i$) \
  ]
]
```

```
#pseudo(caption: "For each number between 1 and 10 in descending order")[
  #pfor($i$, "1", "10", cumul: "-1")[
    #pout($i$) \
  ]
]
```

### Return keyword

```
#pseudo(caption: "Return a value")[
  #preturn($g_b$)
]
```

### Referencing an algorithm

Referencing an algorithm can be done with the `pref` function

```
#pseudo(caption: "Return a value")[
  #preturn($g_b$)
] <alg:test>

We can see an example in #pref(<alg:test>).
```
