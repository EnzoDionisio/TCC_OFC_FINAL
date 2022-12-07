
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
  firebase.initializeApp(firebaseConfig)

  const storage = firebase.storage()

  let image_url = ""
  const inputFile = document.getElementById("input-file")

inputFile.addEventListener('change', (e) => {
  let file = e.target.files[0]

    const uploadTask = storage.ref(`categorias/${file.name}`).put(file)

    uploadTask.on("state_changed", () => {
      uploadTask.snapshot.ref.getDownloadURL().then((url_imagem) => {
        image_url = url_imagem
      })
    })
  })
  

  export default async function sendRecipe(data) {
    const userData = {
        data,
        "image_url": image_url
    }

     await fetch("http://localhost:8081/sendRecipe", {method: "POST", body: JSON.stringify(userData), headers: {"Content-Type": "application/json"}})
      .then((response) => response.json())
      .then((data) => {return data}); 
}