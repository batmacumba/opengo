```
# DISCLAIMER:
This is a work in progress.
Do not use this in a live show.
```

# opengo

opengo can receive serial messages from arduino boards or similars and fire the corresponding applescripts for QLab control. Easily make your own custom go box, and use this app to control QLab without worrying about keyboard focus or MIDI.

## Bundled app

[v0.1-alpha](https://github.com/batmacumba/opengo/releases/tag/v0.1-alpha)

## Developers

Open the project in XCode and build it. If you have an arduino board you can write your own code or use the sample provided. Simply program a button to send one of the serial messages in the dictionary.

### Running

The app will look for a usb serial device when it starts. If you have an arduino board plugged in it will connect immediately using 9600 baud rate. If you wish to change the device or the rate click the status bar "G".

### Dictionary

The following messages are available at the current version:
```
* QLab_Go: fires the currently selected cue
* QLab_Stop: stops all (?) cues
* QLab_Pause: pauses the selected cue
* QLab_Load: loads the selected cue
* QLab_Down: moves the playhead to the next cue
* QLab_Up: moves the playhead to the previous cue
```


## Contributing

Feel free to send pull requests if you're interested. I'm a rookie objc/cocoa coder, so I feel like I made lots of mistakes.

## Get in touch

* **Bruno Carneiro da Cunha** - brunocarneirodacunha@usp.br

