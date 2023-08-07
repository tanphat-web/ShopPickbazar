const buttonLogin = document.querySelectorAll('.auth')
const formLogin = document.getElementById('formLogin')
const buttonHideFormLogin = formLogin.querySelector('.btnClose')
const formLoginOverlay = formLogin.querySelector('.overlay')
const buttonAuth = formLogin.querySelectorAll('.btn-auth')
buttonAuth.forEach(button => button.addEventListener('click',showModalAuth))
if (buttonLogin != null) {
    buttonLogin.forEach(button => {
        button.addEventListener('click', showModalLogin)
    })
    buttonHideFormLogin.addEventListener('click', hideModalLogin)
    formLoginOverlay.addEventListener('click', hideModalLogin)
}
function showModalLogin(e) {
    e.preventDefault()
    formLogin.classList.add('active')
    document.body.classList.add('active')
    document.querySelector('#cart').classList.remove('active');
}
function hideModalLogin() {
    formLogin.classList.remove('active')
    document.body.classList.remove('active')
}

function showModalAuth(event) {
    const targetData = event.target.dataset.button
    const formAuth = document.getElementById(targetData)
    const buttonHideModal = formAuth.querySelector('.btnClose')
    const buttonPrev = formAuth.querySelector('.btn-prev')

    formAuth.classList.remove('hidden')
    formLogin.classList.remove('active')

    buttonHideModal.addEventListener('click', () => { 
        formAuth.classList.add('hidden')
        formLoginOverlay.classList.remove('active')
        document.body.classList.remove('active')
    })
    buttonPrev.addEventListener('click', () => {
        formLogin.classList.add('active')
        formAuth.classList.add('hidden')
    })
}

const btnProductCart = document.getElementById("product-cart")
const cartModal = document.getElementById('cart')
btnProductCart.addEventListener("click", () => {
    cartModal.classList.add('active')
    document.body.classList.toggle('active')
});

const buttonProfile = document.querySelector("header.site-header .profile");
if (buttonProfile != null) {
    buttonProfile.addEventListener("click", () => {
        buttonProfile.querySelector(".profile-menu").classList.toggle("active");
    });
}
window.addEventListener("scroll", () => {
    const headerFixed = document.querySelector("header.site-header");

    window.scrollY >= 300
        ? headerFixed.classList.add("active")
        : headerFixed.classList.remove("active");
});

const buttonShowPassword = document.getElementById("show-password");
const buttonHidePassword = document.getElementById("hide-password");
const pwLogin = document.querySelector("#pw input");
buttonShowPassword.addEventListener("click", () => {
    buttonShowPassword.style.display = "none";
    buttonHidePassword.style.display = "block";
    pwLogin.setAttribute("type", "text");
});
buttonHidePassword.addEventListener("click", () => {
    buttonHidePassword.style.display = "none";
    buttonShowPassword.style.display = "block";
    pwLogin.setAttribute("type", "password");
});

const buttons = document.querySelectorAll(".btn-group");
buttons.forEach((item) => {
    let attribute = item.getAttribute("data-button");
    if (attribute !== null) {
        const id = document.getElementById(attribute);
        const buttonClose = id.querySelector(".btnClose");
        const overlay = id.querySelector(".overlay");
        item.addEventListener("click", () => {
            id.classList.toggle("active");
            item.classList.toggle("text-green-700");
            overlay && document.body.classList.toggle("active");
        });
        buttonClose && buttonClose.addEventListener("click", hide);
        overlay && overlay.addEventListener("click", hide);
        function hide() {
            id.classList.remove("active");
            item.classList.remove("text-green-700");
            overlay && document.body.classList.remove("active");
        }
    }
});
