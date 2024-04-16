**Simple Reusable Shuffle Card: A Swift Package for Interactive Card Stacks**

**Simple Reusable Shuffle Card** is a Swift package that allows you to easily add interactive card stacks to your app. Users can swipe through the cards, making it a great way to display information, images, or other content in an engaging way.

**Features:**

- Three card types: Banner, Grid, and Capsule
- Attachable to any view in your layout
- Customizable appearance

**Getting Started**

**Add ShuffleCard to your project:**

You can add ShuffleCard to your project using Swift Package Manager. Add the following URL to your project's dependencies:

https://github.com/your-username/ShuffleCard.git
 Replace your-username with your GitHub username or the URL of your private repository.

**Import the package:**

Swift
import ShuffleCard
Use code with caution.

** Create a card stack:**

Swift
let cardStack = ShuffleCardStack(frame: CGRect(x: 0, y: 100, width: 300, height: 200))
cardStack.cardType = .banner  // Choose your desired card type

// Add cards to the stack
let card1 = ShuffleCard(title: "Card Title 1", content: "This is the content of card 1")
let card2 = ShuffleCard(title: "Card Title 2", image: UIImage(named: "image2.png"))
cardStack.addCards([card1, card2])

view.addSubview(cardStack)
Use code with caution.

** Customization**

You can customize the appearance of the card stack and cards by setting properties like backgroundColor, cornerRadius, and textColor. Each card type also offers specific customization options.

**Documentation**

For more detailed information on usage and customization options, please refer to the API documentation included in the package.

**Contributing**

We welcome contributions to **Simple Reusable Shuffle Card**! If you have a feature request or bug fix, please feel free to open an issue on the project's GitHub repository.
