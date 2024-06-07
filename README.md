# AutoClicker AHK Script

This AutoHotkey (AHK) script allows users to record and replay a pattern of mouse clicks. It's designed to capture the location of each click, enabling the reproduction of the exact sequence indefinitely until toggled off.

## Features

- **Record Clicks**: Users can record a sequence of mouse clicks, including their positions.
- **Playback Clicks**: The recorded clicks can be played back repeatedly, mimicking the original pattern of the clicks.
- **Toggle Control**: Simple hotkey-based control for starting/stopping recording and playback.

## Getting Started

### Prerequisites

You must have AutoHotkey installed on your Windows machine. Download and install it from the [official AutoHotkey website](https://www.autohotkey.com/).

### Installation

1. **Clone the Repository**: Clone this repository to your local machine using `git clone`, or simply download the script file.
2. **Run the Script**: Double-click the script file to start it. You should see the AutoHotkey icon appear in your system tray, indicating that the script is running.

### Usage

- **Start Recording**: Press `F8` to begin recording mouse clicks. A tooltip will appear near the cursor indicating that recording is active.
- **Stop Recording**: Press `F8` again to stop recording. A tooltip will confirm that recording has stopped.
- **Start Playback**: Press `F9` to start the playback of recorded clicks. Playback will continue to loop until stopped.
- **Stop Playback**: Press `F9` again to stop the playback.

## Script Details

This script uses the AutoHotkey scripting language. Key sections include:
- **Record Click Function**: Captures mouse positions and times, storing them in an array.
- **Playback Function**: Uses a loop to simulate the recorded clicks based on the stored data.
- **Toggle Functions**: Controls the state of recording and playback.

## Contributing

Contributions to this script are welcome. If you have a suggestion that would improve this, please fork the repository and create a pull request. You can also simply open an issue with the tag "enhancement".
- Fork the Project
- Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
- Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
- Push to the Branch (`git push origin feature/AmazingFeature`)
- Open a Pull Request
