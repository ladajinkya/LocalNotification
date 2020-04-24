

import UIKit
import UserNotifications
class ViewController: UIViewController,UNUserNotificationCenterDelegate {
    let content = UNMutableNotificationContent()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func registerBtnAction(_ sender: Any)
    {
        self.grantAccess()
    }
    @IBAction func sendNotification(_ sender: Any) {
        self.setpNotificationwithContent()
    }
    func grantAccess()
    {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) {
            (granted, error) in
            if granted {
                print("Granted")
            } else {
                print("Denied")
            }
        }
    }
    func setpNotificationwithContent()
    {
        var dateString = String()
        dateString = "2020-04-24 14:37:00"
        let date = self.StringToDate(dateStr: dateString)
        print("date = \(date)")
        
        content.title = "Hello viewers"
        content.body = "This is noitifcation body"
        content.sound = UNNotificationSound.default
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        print("trigger date = \(triggerDate)")
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        let request = UNNotificationRequest.init(identifier: "YOUR_UNIQUE_IDENTIFIER", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
    }
    func StringToDate(dateStr: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        let dateFromString = dateFormatter.date(from: dateStr)
        print("dateFromString: ", dateFromString!)
        return dateFromString!
    }
}

