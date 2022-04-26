function generateColor(){
	let r = parseInt(Math.random()*255);
	let g = parseInt(Math.random()*255);
	let b = parseInt(Math.random()*255);
	return `rgb( ${r}, ${g}, ${b})`
}

function cateChart(id, cateLables=[], cateInfo=[]){
	let colors =[]
	for(let i = 0; i < cateLables.length; i++){
		colors.push(generateColor())
	}
	const data = {
	  labels: cateLables,
	  datasets: [{
	    label: '',
	    data: cateInfo,
	    backgroundColor: colors,
	    borderColor: colors,
	    borderWidth: 1
	  }]
	};
	const config = {
	  type: 'bar',
	  data: data,
	  options: {
	    scales: {
	      y: {
	        beginAtZero: true
	      }
	    }
	  },
	};
	let ctx = document.getElementById(id).getContext("2d");
	new Chart(ctx, config);
}