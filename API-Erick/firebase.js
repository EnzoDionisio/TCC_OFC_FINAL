import { initializeApp } from "firebase/app";
import { getStorage, ref, uploadBytes } from "firebase/storage";

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
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
const app = initializeApp(firebaseConfig);

const storage = getStorage()

export function storageImage(imgUrl) {
    const upload = storage.ref().child('categorias').child(imgUrl)
}