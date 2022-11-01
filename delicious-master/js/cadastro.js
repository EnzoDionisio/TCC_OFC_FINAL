let btn = document.querySelector('.lnr-ey');
const olhojs = document.getElementById("olho")
btn.addEventListener('click', function() {
    let input = document.querySelector('#password');
    if(input.getAttribute('type') == 'password') {
    olhojs.setAttribute("src", "img/core-img/olhofechado.png")
        
input.setAttribute('type', 'text');
    } else {
        input.setAttribute('type', 'password');
        olhojs.setAttribute("src", "img/core-img/olhoaberto.png")

    }
});




function MascaraTelefone(){
    var CampoTel = document.getElementById("Tel");

    var Tel = CampoTel.value;

    if(Tel.length == 1){
        Tel = "(" + Tel
        CampoTel.value = Tel;
        return true;
    }
    if(Tel.length == 3){
        Tel = Tel + ")" 
        CampoTel.value = Tel;
        return true;
    }
    if(Tel.length == 9){
        Tel = Tel + "-" 
        CampoTel.value = Tel;
        return true;
    }

}