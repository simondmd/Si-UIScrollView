//
//  ViewController.swift
//  Si UIScrollView
//
//  Created by Simon Davies on 16/02/2017.
//  Copyright © 2017 Simon Davies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ScrollView: UIScrollView!// links the storyboard ScrollView to the code in this ViewController class
    
    var images = [UIImageView]()// this is an array for storing the icon imageviews in as we create them later. Not actually needed in this all

    override func viewDidLoad() { // boilerplate function which includes immediate actions once screen has loaded
        super.viewDidLoad() // boilerplate
        
        var newX: CGFloat = 0.0
        var contentWidth: CGFloat = 0.0
        
        for x in 0...2 {// loop counting x value up 0,1,2 and applying vlaue to the code below
           
            // an actual image file needs to be added to a UIImage property which needs to be added to a UIImageView property. The UIImageView can then be placed on the screen View (lol hehe oh my)
            
                    // make a UIImage type constant called 'image' for the actual .png graphic
            let image = UIImage(named: "icon\(x).png")
           
                    // make a UIImageView type constant called 'iamageView' which holds the UIImage called 'image'
            let imageView = UIImageView(image: image)
            
                    // as x increments through 0,1,2 add the UIImageViews for each icon (Icon0.png... Icon2.png) to the array images'. Note these imageViews do not need storing in this program, but has been done to illustrate as often you will want to access them later
            images.append(imageView)
           
                    // initialise the x co-ordinate variable for placing icons, type is automatically 32 or 64 bit depending on device capability - CG relates to Core Graphics - so basically the same as Double
            
                    // setting the x co-oridnate for each icon as the loop increments. icon0 will be middle of screen, icon1 will be middle of a screen to the right of the actual screen, icon2 will be middle of a screen two screens to right of actual screen
            newX = view.frame.midX + view.frame.size.width * CGFloat(x) //CGFLoat(x) is type casting - it was Int, needs to be CGFloat here to match newX type
            
                    // adds a subview onto the ScrollView into which imageView of icon is placed so we can see it
            ScrollView.addSubview(imageView)
            
                    // image view frame is defined (otherwise will use an arbitary unpredicatable size) and position using the newX property and the screen view's frame size (as we know that is the whole screen). May want to write code to detect screen size of device and alter to look best on each device.
            imageView.frame = CGRect (x: newX - 75, y: (view.frame.size.height) / 2 - 75, width: 150, height: 150)
        
                    // ScrollView content area width needs to be 3 screens wide
            contentWidth = view.frame.size.width * CGFloat(x+1)
        }
        // set the ScrollView content size to expand 3 screens to the right to accommodate the 3 icons
        ScrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
    }


}

