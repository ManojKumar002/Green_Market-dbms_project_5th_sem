
/* Search-Form table*/
let searchForm = document.querySelector('.search-form');

document.querySelector('#search-btn').onclick = () => {
	searchForm.classList.toggle('active');
	shoppingCart.classList.remove('active');
	loginForm.classList.remove('active');
	navbar.classList.remove('active');
	SignupForm.classList.remove('active');
	loginChoice.classList.remove('active');
}


/* Shopping cart table*/
let shoppingCart = document.querySelector('.shopping-cart');

document.querySelector('#cart-btn').onclick = () => {
	shoppingCart.classList.toggle('active');
	searchForm.classList.remove('active');
	loginForm.classList.remove('active');
	navbar.classList.remove('active');
	try{
		SignupForm.classList.remove('active');
	}catch(e){
		console.log(e);
	}
	loginChoice.classList.remove('active');

}

try {
	/* Add products form starts */

	let AddproductForm = document.querySelector('.add-pro');
	document.querySelector('#add-product').onclick = () => {
		AddproductForm.classList.toggle('active');
		searchForm.classList.remove('active');
		shoppingCart.classList.remove('active');
	}

	/*Add products form ends*/
} catch (err) {
	console.log(err);
}

try {
	/* User Login form*/

	let loginForm = document.querySelector('.login-form');

	document.querySelector('.dropbtnyyy').onclick = () => {
		loginForm.classList.toggle('active');
		searchForm.classList.remove('active');
		shoppingCart.classList.remove('active');
		navbar.classList.remove('active');
		SignupForm.classList.remove('active');
		loginChoice.classList.remove('active');
	}

	/* Farmer Login form*/

	let FloginForm = document.querySelector('.Flogin-form');
	document.querySelector('.dropbtn0').onclick = () => {
		FloginForm.classList.toggle('active');
		searchForm.classList.remove('active');
		shoppingCart.classList.remove('active');
		navbar.classList.remove('active');
		SignupForm.classList.remove('active');
		loginChoice.classList.remove('active');
	}

	/* Login Choice*/

	let loginChoice = document.querySelector('.log');
	document.querySelector('.dropbtn').onclick = () => {
		loginChoice.classList.toggle('active');
		searchForm.classList.remove('active');
		shoppingCart.classList.remove('active');
		navbar.classList.remove('active');
		loginForm.classList.remove('active');
		SignupForm.classList.remove('active');
		FSignupForm.classList.remove('active');
		FloginForm.classList.remove('active');

	}


	/* Farmer Signup form*/

	let FSignupForm = document.querySelector('.Fsignup-form');

	document.querySelector('.Ssign a').onclick = () => {
		FSignupForm.classList.toggle('active');
		loginForm.classList.remove('active');
		searchForm.classList.remove('active');
		shoppingCart.classList.remove('active');
		navbar.classList.remove('active');
		loginChoice.classList.remove('active');
	}


	/* User Signup form*/


	let SignupForm = document.querySelector('.signup-form');

	document.querySelector('.sign a').onclick = () => {
		SignupForm.classList.toggle('active');
		loginForm.classList.remove('active');
		searchForm.classList.remove('active');
		shoppingCart.classList.remove('active');
		navbar.classList.remove('active');
	}

	/* User Click on Signup Submit button*/

	/*let Sign_Sub = document.querySelector('#S-Sbtn');*/
	document.querySelector('#S-Sbtn').onclick = () => {
		SignupForm.classList.remove('active');
		loginForm.classList.toggle('active');
	}

	/* When User has an account , SignUp page to login page */

	document.querySelector('.signup-form a').onclick = () => {
		loginForm.classList.toggle('active');
		SignupForm.classList.remove('active');
	}

	/* Farmer Click on Signup Submit button*/

	document.querySelector('#FS-Sbtn').onclick = () => {
		FSignupForm.classList.remove('active');

	}

	/* When Farmer has an account , SignUp page to login page */

	document.querySelector('.Fsignup-form a').onclick = () => {

		FSignupForm.classList.remove('active');

	}

}

catch (err) {
	console.log(err)
}



document.querySelector('.dropbtn').doubleclick = () => {
	SignupForm.classList.remove('active');
	loginForm.classList.remove('active');
	FSignupForm.classList.remove('active');
	FloginForm.classList.remove('active');
}




let navbar = document.querySelector('.navbar');

document.querySelector('#menu-btn').onclick = () => {
	navbar.classList.toggle('active');
	searchForm.classList.remove('active');
	shoppingCart.classList.remove('active');
	loginForm.classList.remove('active');
}

window.onscroll = () => {
	searchForm.classList.remove('active');
	shoppingCart.classList.remove('active');
	loginForm.classList.remove('active');
	navbar.classList.remove('active');
}

var swiper = new Swiper(".product-slider", {
	loop: true,
	spaceBetween: 20,
	autoplay: {
		delay: 7500,
		disableOnInteraction: false,
	},
	centeredSlides: true,
	breakpoints: {
		0: {
			slidesPerView: 1,
		},
		768: {
			slidesPerView: 2,
		},
		1020: {
			slidesPerView: 3,
		},
	},
});

var swiper = new Swiper(".review-slider", {
	loop: true,
	spaceBetween: 20,
	autoplay: {
		delay: 7500,
		disableOnInteraction: false,
	},
	centeredSlides: true,
	breakpoints: {
		0: {
			slidesPerView: 1,
		},
		768: {
			slidesPerView: 2,
		},
		1020: {
			slidesPerView: 3,
		},
	},
});



const apiKey = "8b19a5a68ea5abba7051f9cb17cdcbbc";
const main = document.getElementById('main');
const form = document.getElementById('form');
const search = document.getElementById('search');
const url = (city) => `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}`;
async function getWeatherByLocation(city) {
	const resp = await fetch(url(city), {
		origin: "cros"
	});
	const respData = await resp.json();
	addWeatherToPage(respData);
}
function addWeatherToPage(data) {
	const temp = Ktoc(data.main.temp);
	const weather = document.createElement('div')
	weather.classList.add('weather');
	weather.innerHTML = `  
      <h2><img src="https://openweathermap.org/img/wn/${data.weather[0].icon}@2x.png" />
       ${temp}°C </h2>  
      <h2>${data.weather[0].main}</h2>  
      `;
	//  cleanup   
	main.innerHTML = "";
	main.appendChild(weather);
};
function Ktoc(K) {
	return Math.floor(K - 273.15);
}
form.addEventListener('submit', (e) => {
	e.preventDefault();
	const city = search.value;
	if (city) {
		getWeatherByLocation(city)
	}
});
document.querySelector('#cut-btn').onclick = () => {
	main.innerHTML = "";
	document.getElementById('search').value = '';

}

