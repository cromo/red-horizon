Red [
    Title: "Image drawing"
    Red-Version: 0.6.3
    Takeaways: {
        Unlike drawing directly to a GUI face, drawing on an image does not
        clear the image; instead it just puts new pixels on top of the
        existing image. This is useful because a full image can be built up
        across multiple draw calls instead of having to draw everything at
        once.
    }
]

hi-image: load %hi.png
save %hi-modified.png draw hi-image [
    circle 32x32 5
]