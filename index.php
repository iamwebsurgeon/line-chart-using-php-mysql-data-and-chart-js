<?php
	/* Database connection settings */
	include_once 'db.php';

	$data1 = '';
	$data2 = '';
	$buildingName = '';

	$query = "SELECT costs.cost_id, costs.building_id, buildings.building_name, costs.consumption_date, costs.gas_consumption, costs.gas_cost, costs.created_at, costs.updated_at FROM costs INNER JOIN buildings ON costs.building_id = buildings.building_id";
	
    $runQuery = mysqli_query($conn, $query);

	while ($row = mysqli_fetch_array($runQuery)) {

		$data1 = $data1 . '"'. $row['gas_consumption'].'",';
		$data2 = $data2 . '"'. $row['gas_cost'] .'",';
		$buildingName = $buildingName . '"'. ucwords($row['building_name']) .'",';
	}

	$data1 = trim($data1,",");
	$data2 = trim($data2,",");
	$buildingName = trim($buildingName,",");
?>

<!DOCTYPE html>
<html>
	<head>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
		<title>Line Chart using PHP MySQL and Chart JS</title>

		<style type="text/css">			
			body{
				font-family: Arial;
			    margin: 80px 100px 10px 100px;
			    padding: 0;
			    color: white;
			    text-align: center;
			    background: #555652;
			}

			.container {
				color: #E8E9EB;
				background: #222;
				border: #555652 1px solid;
				padding: 10px;
			}
		</style>

	</head>

	<body>	   
	    <div class="container">	
	    <h1>Line Chart using PHP MySQL and Chart JS</h1>       
			<canvas id="chart" style="width: 100%; height: 65vh; background: #222; border: 1px solid #555652; margin-top: 10px;"></canvas>

			<script>
				var ctx = document.getElementById("chart").getContext('2d');
    			var myChart = new Chart(ctx, {
        		type: 'line',
		        data: {
		            labels: [<?php echo $buildingName; ?>],
		            datasets: 
		            [{
		                label: 'Consumption',
		                data: [<?php echo $data1; ?>],
		                bbackgroundColor: 'transparent',
		                borderColor:'rgba(255,99,132)',
		                borderWidth: 3
		            },

		            {
		            	label: 'Cost',
		                data: [<?php echo $data2; ?>],
		                backgroundColor: 'transparent',
		                borderColor:'rgba(0,255,255)',
		                borderWidth: 3	
		            }]
		        },
		     
		        options: {
		            scales: {scales:{yAxes: [{beginAtZero: false}], xAxes: [{autoskip: true, maxTicketsLimit: 20}]}},
		            tooltips:{mode: 'index'},
		            legend:{display: true, position: 'top', labels: {fontColor: 'rgb(255,255,255)', fontSize: 16}}
		        }
		    });
			</script>
	    </div>
	    
	</body>
</html>