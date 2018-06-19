//
// AppDelegate.swift
// appIOSes5labTEST
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/06/18
//

import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData
import UserNotifications
import SAPOfflineOData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate, OnboardingManagerDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?

    private let logger = Logger.shared(named: "AppDelegateLogger")
    var gwsamplebasicEntities: GWSAMPLEBASICEntities<OnlineODataProvider>!
    var gwsamplebasicEntitiesOffline: GWSAMPLEBASICEntities<OfflineODataProvider>!

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Set a FUIInfoViewController as the rootViewController, since there it is none set in the Main.storyboard
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = FUIInfoViewController.createSplashScreenInstanceFromStoryboard()

        do {
            // Attaches a LogUploadFileHandler instance to the root of the logging system
            try SAPcpmsLogUploader.attachToRootLogger()
        } catch {
            self.logger.error("Failed to attach to root logger.", error: error)
        }

        UINavigationBar.applyFioriStyle()

        OnboardingManager.shared.delegate = self
        OnboardingManager.shared.onboardOrRestore()

        return true
    }

    // To only support portrait orientation during onboarding
    func application(_: UIApplication, supportedInterfaceOrientationsFor _: UIWindow?) -> UIInterfaceOrientationMask {
        switch OnboardingFlowController.presentationState {
        case .onboarding, .restoring:
            return .portrait
        default:
            return .allButUpsideDown
        }
    }

    // Delegate to OnboardingManager.
    func applicationDidEnterBackground(_: UIApplication) {
        OnboardingManager.shared.applicationDidEnterBackground()
    }

    // Delegate to OnboardingManager.
    func applicationWillEnterForeground(_: UIApplication) {
        OnboardingManager.shared.applicationWillEnterForeground()
    }

    func onboarded(onboardingContext: OnboardingContext) {
        self.configureOData(onboardingContext.sapURLSession, onboardingContext.authenticationURL!)
        self.setRootViewController()

        self.uploadLogs(onboardingContext.sapURLSession, onboardingContext.sapcpmsSettingsParameters!)
        self.registerForRemoteNotification(onboardingContext.sapURLSession, onboardingContext.sapcpmsSettingsParameters!)
    }

    private func setRootViewController() {
        DispatchQueue.main.async {
            let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
            //viewController.delegate = self
            viewController.modalPresentationStyle = .currentContext
            //viewController.preferredDisplayMode = .allVisible
            self.window!.rootViewController = viewController
        }
    }

    // MARK: - Split view

    func splitViewController(_: UISplitViewController, collapseSecondary _: UIViewController, onto _: UIViewController) -> Bool {
        // The first Collection will be selected automatically, so we never discard showing the secondary ViewController
        return false
    }

    // MARK: - Remote Notification handling

    private var deviceToken: Data?

    func application(_: UIApplication, willFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
        UIApplication.shared.registerForRemoteNotifications()
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
            // Enable or disable features based on authorization.
        }
        center.delegate = self
        return true
    }

    // Called to let your app know which action was selected by the user for a given notification.
    func userNotificationCenter(_: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        self.logger.info("App opened via user selecting notification: \(response.notification.request.content.body)")
        // Here is where you want to take action to handle the notification, maybe navigate the user to a given screen.
        completionHandler()
    }

    // Called when a notification is delivered to a foreground app.
    func userNotificationCenter(_: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        self.logger.info("Remote Notification arrived while app was in foreground: \(notification.request.content.body)")
        // Currently we are presenting the notification alert as the application were in the background.
        // If you have handled the notification and do not want to display an alert, call the completionHandler with empty options: completionHandler([])
        completionHandler([.alert, .sound])
    }

    func registerForRemoteNotification(_ urlSession: SAPURLSession, _ settingsParameters: SAPcpmsSettingsParameters) {
        guard let deviceToken = self.deviceToken else {
            // Device token has not been acquired
            return
        }

        let remoteNotificationClient = SAPcpmsRemoteNotificationClient(sapURLSession: urlSession, settingsParameters: settingsParameters)
        remoteNotificationClient.registerDeviceToken(deviceToken) { error in
            if let error = error {
                self.logger.error("Register DeviceToken failed", error: error)
                return
            }
            self.logger.info("Register DeviceToken succeeded")
        }
    }

    func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        self.deviceToken = deviceToken
    }

    func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        self.logger.error("Failed to register for Remote Notification", error: error)
    }

    // MARK: - Log uploading

    // This function is invoked on every application start, but you can reuse it to manually triger the logupload.
    private func uploadLogs(_ urlSession: SAPURLSession, _ settingsParameters: SAPcpmsSettingsParameters) {
        SAPcpmsLogUploader.uploadLogs(sapURLSession: urlSession, settingsParameters: settingsParameters) { error in
            if let error = error {
                self.logger.error("Error happened during log upload.", error: error)
                return
            }
            self.logger.info("Logs have been uploaded successfully.")
        }
    }

    // MARK: - Configure OData

    private func configureOData(_ urlSession: SAPURLSession, _ serviceRoot: URL) {
        let odataProvider = OnlineODataProvider(serviceName: "GWSAMPLEBASICEntities", serviceRoot: serviceRoot, sapURLSession: urlSession)
        // Disables version validation of the backend OData service
        // TODO: Should only be used in demo and test applications
        odataProvider.serviceOptions.checkVersion = false
        self.gwsamplebasicEntities = GWSAMPLEBASICEntities(provider: odataProvider)
        // To update entity force to use X-HTTP-Method header
        self.gwsamplebasicEntities.provider.networkOptions.tunneledMethods.append("MERGE")
        
        var offlineParameters = OfflineODataParameters()
        offlineParameters.enableRepeatableRequests = true
        
        // create offline OData provider
        let offlineODataProvider = try! OfflineODataProvider(
            serviceRoot: URL(string: serviceRoot.absoluteString)!,
            parameters: offlineParameters,
            sapURLSession: urlSession
        )
        
        // define offline defining query
        try! offlineODataProvider.add(
            definingQuery: OfflineODataDefiningQuery(
                name: CollectionType.productSet.rawValue,
                query: "/\(CollectionType.productSet.rawValue)",
                automaticallyRetrievesStreams: false
            )
        )
        try! offlineODataProvider.add(
            definingQuery: OfflineODataDefiningQuery(
                name: CollectionType.businessPartnerSet.rawValue,
                query: "/\(CollectionType.businessPartnerSet.rawValue)",
                automaticallyRetrievesStreams: false
            )
        )
        try! offlineODataProvider.add(
            definingQuery: OfflineODataDefiningQuery(
                name: CollectionType.contactSet.rawValue,
                query: "/\(CollectionType.contactSet.rawValue)",
                automaticallyRetrievesStreams: false
            )
        )
        try! offlineODataProvider.add(
            definingQuery: OfflineODataDefiningQuery(
                name: CollectionType.salesOrderSet.rawValue,
                query: "/\(CollectionType.salesOrderSet.rawValue)",
                automaticallyRetrievesStreams: false
            )
        )
        
        gwsamplebasicEntitiesOffline = GWSAMPLEBASICEntities(provider: offlineODataProvider)

    }
}
