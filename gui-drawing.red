Red [
    Title: "Drawing test"
    Needs: 'View
    Red-Version: 0.6.3
    Takeaways: {
        In a draw block, a set-word! saves the position in the block as an
        iterator within the block the word resides in. This means that full
        navigation within the block is possible using iteration functions
        (next/back/head/tail) and numeric indexing. Modifying the existing
        values in the block cause it to redraw; previous draws are erased from
        the canvas.

        It would appear that sub-blocks in a draw section are ignored for the
        sake of drawing, and thus can be used as an organizational tool. When
        combined with the set-word! above, this gives easy access to entire
        segments of the scene graph.

        sine cannot accept a time! as its argument, which somewhat surprised
        me. The correction is to call to-float first.

        Getting subsecond times requires the use of now/precise. By default,
        now is only second resolution.

        It appears that pair! cannot have non-integer members. I tried setting
        one of the members to the result of sine (which is of type float!) and
        it prevented the circle from being drawn except when the output was
        zero. This is unfortunate, as it means lots of casting when setting up
        a scene.
    }
    Todo: {
        - Bug: circle position jumps at the top of the minute
    }
]

view [
    title "Drawing test"
    base 200x200 rate 60 now draw [
        c: circle 40x100 25
        [circle 150x150 30]
    ] on-time [
        time: now/precise
        c/2/2: 100 + to-integer 50 * sine 200 * time/second
    ]
]