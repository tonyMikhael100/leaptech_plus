// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import '../../firebase_options.dart';

// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();
//   factory NotificationService() => _instance;
//   NotificationService._internal();

//   final FirebaseMessaging _messaging = FirebaseMessaging.instance;

//   Future<void> init() async {
//     // Initialize Firebase
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );

//     // Create channel & permissions
//     await _createAndroidNotificationChannel();
//     await _requestPermission();

//     // Handlers for background, foreground, and terminated messages
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     FirebaseMessaging.onMessage.listen(_onForegroundMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

//     // Handle notification when app is completely terminated
//     await _checkTerminatedMessage();

//     // Get FCM token
//     final token = await _messaging.getToken();
//     if (kDebugMode) print('🔹 FCM Token: $token');
//   }

//   Future<void> _createAndroidNotificationChannel() async {
//     // Enables sound in notifications
//     await _messaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     if (kDebugMode) print('✅ Android notification channel ready with sound.');
//   }

//   Future<void> _requestPermission() async {
//     final settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     if (kDebugMode) {
//       print('🔔 Notification Permission: ${settings.authorizationStatus}');
//     }
//   }

//   void _onForegroundMessage(RemoteMessage message) {
//     if (kDebugMode) {
//       print('📩 Foreground Message: ${message.notification?.title}');
//       print('📄 Message Body: ${message.notification?.body}');
//     }
//   }

//   void _onMessageOpenedApp(RemoteMessage message) {
//     if (kDebugMode) {
//       print(
//           '📨 Notification tapped (background): ${message.notification?.title}');
//     }
//   }

//   /// Handles messages received when the app was terminated (not running)
//   Future<void> _checkTerminatedMessage() async {
//     final message = await FirebaseMessaging.instance.getInitialMessage();
//     if (message != null) {
//       if (kDebugMode) {
//         print(
//             '🚀 App opened from terminated state via notification: ${message.notification?.title}');
//       }
//       // Handle navigation or logic here if needed
//     }
//   }
// }

// /// Background message handler (required top-level function)
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   if (kDebugMode) {
//     print('💤 Background message: ${message.notification?.title}');
//   }
// }
