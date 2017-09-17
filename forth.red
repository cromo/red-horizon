Red [
    Title: "Toy forth"
    Red-Version: 0.6.3
    Takeaways: {
        If your language is simple enough, you can just use Red's parser. In
        this case, only valid Red syntax is used for defining forth values.

        Use a get-word! (aka :word) to get the value of a function without
        evaluating it.

        Map literals #() can't handle functions being defined directly in them
        because the block formed by the literal is not evaluated before
        assignment; thus the literal sees the key, the word func, and two
        blocks. Because blocks cannot be used as keys, this causes an error.
        To get around this, use `make map! compose [...]` instead and put all
        function definitions in parentheses.
    }
    Todo: {
        - Allow word definitions within the interpreter
        - Add looping constructs
        - Write a function to lift a red function into a forth function,
          potentially allowing for parameter and return value reordering
        - Write a helper for constructing environments
        - Add a REPL
        - Allow evaluation of command-line arguments
    }
]

comment {
    A real forth would also return its environment because new words could be
    defined every time its run. This would build up an "image" that could
    potentially be serialized.
}
forth: func [stack env commands /local f][
    foreach command commands [
        f: select env command
        either :f [f stack][append stack command]
    ]
    stack
]

push: :append
pop: func [series][take/last series]

env: make map! compose [
    + (func [s][push s (pop s) + (pop s)])
    swap (func [s /local temp1 temp2][
        temp1: pop s
        temp2: pop s
        push s temp1
        push s temp2
    ])
    . (func [s][print pop s])
    <s> (func [s][probe s])
]

;probe forth copy [] make map! compose [* (func [s][push s (pop s) * (pop s)])] [2 4 *]
forth forth copy [] env [1 2 swap <s>] env [+ .]
forth copy [] env [1 2 swap <s> + .]