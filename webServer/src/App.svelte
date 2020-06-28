<script>
	let ssid = null;
	let wkey = null;
	let disabled = false;

	async function configureWifi(ssid,wkey) {
		disabled = true;
		let userData;
		let user = await fetch(`http://localhost:5001/wifi_creds?ssid=${ssid}&key=${wkey}`)
			.then(b => userData = b)
			.then(setTimeout(() => { disabled = false }, 10000))
	}
</script>

<main>
	<div class="form">
		<h2>Yarden Gnome Station</h2>
		<h5>Connect to your wi-fi:</h5>
		<div>
			SSID:<br />
		</div>
		<input type="text" id="ssid" name="ssid" bind:value={ssid}>

		<div>
			Password:<br/>
		</div>
		<input type="text" id="wkey" name="wkey" bind:value={wkey}>

		<button on:click={() => configureWifi(ssid, wkey)} disabled={disabled}>Submit</button>
	</div>
</main>

<style>
	main {
		max-width: 768px;
		text-align: center;
		margin: 0 auto;
		height: 100vh;
	}
	
	div {
		text-align: left;
	}

	.form {
		width: auto;
		margin: 0 auto;
		margin-top: 20vh;
		display: flex;
		flex-direction: column;
		padding: 40px;
	}

	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 4em;
		font-weight: 100;
	}
</style>