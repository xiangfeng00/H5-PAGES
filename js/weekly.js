var water = document.getElementById('water'),
    cnt = document.getElementById('count'),
    percent = cnt.innerHTML;
	water.style.transform = 'translate(0, ' + (100 - percent) + '%)';

