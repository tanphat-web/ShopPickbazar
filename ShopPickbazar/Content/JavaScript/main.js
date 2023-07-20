const headerFixed = document.querySelector("header.site-header");
const buttonProfile = document.querySelector("header.site-header .profile");
buttonProfile &&
  buttonProfile.addEventListener("click", () => {
    buttonProfile.querySelector(".profile-menu").classList.toggle("active");
  });
window.addEventListener("scroll", () => {
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

const btnProductCart = document.getElementById("product-cart");

btnProductCart.addEventListener("click", () => {
  document.getElementById("cart").classList.add("active");
  document.body.classList.toggle("active");
});

const btnFilters = document.getElementById("btn-filter");
const menuFilter = document.getElementById("menu-filter");
const buttonCloseMenuFilters = menuFilter.querySelector(".btnClose");
const menuFilterOverlay = menuFilter.querySelector(".overlay");
btnFilters.addEventListener("click", () => {
  menuFilter.classList.add("active");
  document.body.classList.add("active");
});
buttonCloseMenuFilters.addEventListener("click", hideMenuFiters);
menuFilterOverlay.addEventListener("click", hideMenuFiters);
function hideMenuFiters() {
  menuFilter.classList.remove("active");
  document.body.classList.remove("active");
}

document.querySelector("#auth").addEventListener("click", () => {
  document.getElementById("formLogin").classList.add("active");
  document.body.classList.toggle("active");
});
