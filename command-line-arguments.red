Red [
    Title: "Command line arguments"
    Red-Version: 0.6.3
    Takeaways: {
        When running as a script:

        system/options/script is the file! of the script to interpret.
        system/options/args is the block! of strings that contains all
        arguments passed to the script (i.e. after the script name).
        system/script/args is system/options/args joined by spaces. Don't know
        when one would use that, but it's there.

        When running a compiled executable, system/options/script is none. I
        wonder if there's another way to get `argv[0]`-like functionality.
        system/options/args and system/script/args are none if no arguments
        were passed.
    }
]

probe system/options/script
probe system/options/args
probe system/script/args