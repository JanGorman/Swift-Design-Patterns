// Playground - noun: a place where people can play

import UIKit

protocol TapBehavior {
    
    func tap()
    
}

class CartTapBehavior: TapBehavior {
    
    func tap() {
        println("I'm the cart tap")
    }
    
}

class WishListTapBehavior: TapBehavior {
    
    func tap() {
        println("I'm the wish list tap")
    }
    
}

// Use the behaviour

class SomeViewWithAButton: UIView {
    
    @IBOutlet weak var aButton: UIButton!
    
    var tapBehavior: TapBehavior?
    
    @IBAction func didTapButton(sender: AnyObject) {
        tapBehavior?.tap()
    }
    
}

var tapBehavior: TapBehavior = CartTapBehavior()

let view = SomeViewWithAButton()
view.tapBehavior = tapBehavior

view.didTapButton(NSObject())

tapBehavior = WishListTapBehavior()
view.tapBehavior = tapBehavior

view.didTapButton(NSObject())