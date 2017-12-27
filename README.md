```
# DISCLAIMER: This is a work in progress. Do not use this in a live show. I cannot be  responsible for any bugs (there are lots!) or malfunctions.
```

# opengo

opengo can receive serial messages from arduino boards or similars and fire the corresponding applescripts for QLab control. Easily make your own custom go box, and use this app to control QLab without worrying about keyboard focus or MIDI.

## Getting Started

Open the project in XCode and build it. If you have an arduino board you can write your own code or use the sample provided. Simply program a button to send one of the serial messages in the dictionary.

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

Feel free to send pull requests if you're interested. I'm a rookie objc/cocoa coder, so I feel like I made lots of bizarre choices.

## Get in touch

* **Bruno Carneiro da Cunha** - brunocarneirodacunha@usp.br

