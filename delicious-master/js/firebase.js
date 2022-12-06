
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.14.0/firebase-app.js";

  const firebaseConfig = {
    apiKey: "AIzaSyBCPPp9LYXYdmuyvwfkzRfKtND99VRQcwk",
    authDomain: "bucho-cheio-f31b1.firebaseapp.com",
    projectId: "bucho-cheio-f31b1",
    storageBucket: "bucho-cheio-f31b1.appspot.com",
    messagingSenderId: "367844856760",
    appId: "1:367844856760:web:9f4a05d5107971f9b3754d",
    measurementId: "G-YWYQB6KBRT"
  };

  // Initialize Firebase
  const app = firebase.initializeApp(firebaseConfig)

  console.log(firebase.app()); 