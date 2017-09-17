Red [
    Title: "Direct image manipulation"
    Needs: 'View
    Red-Version: 0.6.3
    References: [
        http://www.rebol.com/docs/image.html
        https://github.com/red/red/issues/2856
    ]
    Takeaways: {
        Image size cannot be changed. See Github issue red/red#2856 for more
        info.

        Scaling an image with view uses smoothing; I don't know whether that
        can be disabled.

        Images can be treated directly as series! values; many (but not all)
        functions that operate on series! will also work on images.

        Pixels are represented as tuples of rgb or rgba values.

        The alpha channel is transparency (0 is opaque, 255 is fully
        transparent), not as opacity like most other applications (0 is
        transparent, 255 is opaque).

        Image contents can be set with binary data. When doing this, each
        element is a component of a pixel instead of a tuple.
    }
]

i1: load %hi.png

i2: copy i1
poke i2 1 0.0.0
poke i2 10x10 255.0.0

i3: make image! [16x16]
raw: i3/rgb
poke raw 2 0
i3/rgb: raw

print ["Size of i3:" i3/size]
i3/size: 64x64
print ["Size of i3 after change:" i3/size]

view [
    title "Direct pixel manipulation"
    image 256x256 i1
    image 256x256 i2
    image 256x256 i3
]