# Simple Reusable Shuffle Card

is a Swift package that allows you to easily add interactive card stacks to your app. Users can swipe through the cards, making it a great way to display information, images, or other content in an engaging way.

![capsule-card](https://github.com/leowirasanto2/simple-reusable-shufflecard/assets/156512514/a0417ac4-667b-4024-b038-fff9df26a5d1)
![banner-card](https://github.com/leowirasanto2/simple-reusable-shufflecard/assets/156512514/5b62ea1d-4d25-406a-96f2-59b46529111b)


## Features

- Three card types: Banner, Grid, and Capsule
- Attachable to any view in your layout
- Customizable appearance


## Supported OS

- iOS 17 and above


## Installation


### Swift Package Manager
You can use the SPM to install `Simple Reusable Shuffle Card` by adding the package:

- File > Swift Package > Add package Dependency
- Search https://github.com/leowirasanto2/simple-reusable-shufflecard.git 
- Add package

## Usage
To use this library, you need to follow these steps:

    ShuffleCard(.defaultStyle)
    .environmentObject(CardModel())

### Styles
There are 2 style you can use:
- `.defaultStyle` : rendered as default style
- `.custom(style: CardStyleConfig(....)` : rendered as the config you set.

### Card Data

You can construct the data into `CardModel` and attach it as `.environmentObject` to the ShuffleCard view.

## Contributing

We welcome contributions to ShuffleCard! If you have a feature request or bug fix, please feel free to open an issue on the project's GitHub repository.
