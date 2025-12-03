importScripts('https://www.gstatic.com/firebasejs/10.11.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.11.0/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: "AIzaSyBdETUhd-SeDM9tW6twkfzScREr-N6HvLA",
  authDomain: "mis-labs-8f380.firebaseapp.com",
  projectId: "mis-labs-8f380",
  messagingSenderId: "449475197952",
  appId: "1:449475197952:web:fb048b3e6b54214222ace5",
  storageBucket: "mis-labs-8f380.firebasestorage.app"
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((message) => {
  const notification = message.notification;
  self.registration.showNotification(notification.title, {
    body: notification.body,
    icon: '/icons/Icon-192.png',
  });
});