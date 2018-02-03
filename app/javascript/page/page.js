window.onload = function() {
	let elem = document.getElementById('hello');
	console.log(elem.innerText);
	document.body.insertAdjacentHTML('afterbegin', elem.innerText);
};
