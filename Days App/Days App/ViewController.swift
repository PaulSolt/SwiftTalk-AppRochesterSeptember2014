//
//  ViewController.swift
//  Days App
//
//  Created by Paul Solt on 9/2/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

import UIKit

// Check out the Swift iPhone Courses
// https://www.kickstarter.com/projects/paulsolt/31-days-make-iphone-apps-and-games-with-swift-for
// 
// More Courses: http://learn.iphonedev.tv/course/iPhoneGoldSubscription/
// -Paul Solt
// PaulSolt@iPhoneDev.tv

class ViewController: UIViewController {
    
    // Outlets are auto-generated when you drag-and-drop the UI
    //  to code with the Assistant Editor view (Storyboard -> Code)
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Example variables in Swift
        // 1. No semicolons needed
        // 2. No types needed, unless you want to be explicit
        // 3. All variables start with "var", or "let" for constant values
        var x = 10
        var name = "Paul"
    
        // print and println replace NSLog, less special characters needed
        print("Hi AppRochester") // NSLog(@"Hi");
        println("Hi AppRochester") // NSLog(@"Hi");

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Actions are tied to buttons presses (i.e. finger touch down inside a button)
    @IBAction func calculateAgeButtonPressed(sender: AnyObject) {
        
        println("calculate pressed")

        // Email: PaulSolt@iPhoneDev.tv
        // Any questions?
        
        var dateComponents = NSDateComponents()
        
        // You can express dates like in common language with a NSDateComponents (month/day/year)
        dateComponents.day = dayTextField.text.toInt()!
        dateComponents.month = monthTextField.text.toInt()!
        dateComponents.year = yearTextField.text.toInt()!
        
        // Print the date as a sanity check
        println(dateComponents)
    
        // Use the calendar class to create a NSDate that can be compared to the current date
        var calendar = NSCalendar(identifier: NSGregorianCalendar)
        var birthDate = calendar.dateFromComponents(dateComponents)
        
        var currentDate = NSDate.date()
        
        // Create a new date components object with the difference in time between the start and end dates (birthday and current)
        // 1. Use logical OR to combine multiple forms of days/months/etc
        // NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitMonth
        // Then you can output the difference in terms of both days and months. i.e. 12 months and 3 days ago...
        
        var dayComponents = calendar.components(NSCalendarUnit.CalendarUnitDay, // <- 2. Add additional values to change to months + day, etc.
            fromDate: birthDate!,
            toDate: currentDate,
            options: nil)
        
        var daysAlive = dayComponents.day
//        var monthsAlive = dayComponents.month // 3. See previous comment on setting months flag using logical OR

        // Display an unformatted number (no comma separators)
        println("days alive: \(daysAlive)")
        
        // Format the days to change 1023 into 1,023 days (adding comma or other separator region specific)
        var numberFormatter = NSNumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        var daysAliveString = numberFormatter.stringFromNumber(daysAlive)
        
        // Swift makes it easy to "inline" a variable into a new string
        messageLabel.text = daysAliveString //"\(daysAlive)"
    
    }

}

