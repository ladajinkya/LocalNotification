
import UIKit
import CoreData
import UserNotifications
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {
    var window : UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        // Override point for customization after application launch.
        return true
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("------------------------.")
        
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    didReceive response: UNNotificationResponse,
                                    withCompletionHandler completionHandler: @escaping () -> Void) {
            
            
            
            let application = UIApplication.shared
            
            if(application.applicationState == .active){
              print("user tapped the notification bar when the app is in foreground")
                if response.notification.request.identifier == "YOUR_UNIQUE_IDENTIFIER" {
                           print("handling notifications with the YOUR_UNIQUE_IDENTIFIER Identifier")
                       }
                
        }
            if(application.applicationState == .inactive)
            {
              print("user tapped the notification bar when the app is  inactive")
                if response.notification.request.identifier == "YOUR_UNIQUE_IDENTIFIER" {
                           print("handling notifications with the YOUR_UNIQUE_IDENTIFIER Identifier")
                       }
            }
            
            if(application.applicationState == .background)
            {
              print("user tapped the notification bar when the app is in background")
                if response.notification.request.identifier == "YOUR_UNIQUE_IDENTIFIER" {
                           print("handling notifications with the YOUR_UNIQUE_IDENTIFIER Identifier")
                       }
            }
        else
            {
                print("NO State")
        }
            completionHandler()
        }

    func applicationWillResignActive(_ application: UIApplication) {
       UNUserNotificationCenter.current().delegate = self
        
       }

       func applicationDidEnterBackground(_ application: UIApplication) {
        UNUserNotificationCenter.current().delegate = self
          
       }

       func applicationWillEnterForeground(_ application: UIApplication) {
        UNUserNotificationCenter.current().delegate = self
          
       }

       func applicationDidBecomeActive(_ application: UIApplication) {
            
       }

       func applicationWillTerminate(_ application: UIApplication) {
            
       }

    
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "LocalNotification")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

