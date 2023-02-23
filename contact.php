<!DOCTYPE html>
<html>
<head>
	<title>Malawi Flood Prediction App</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <?php require_once 'header.php'; ?>
</head>
<body>
	<div class="container mt-4">
		<h1 class="text-center mb-3">Contact Us</h1>
		<?php
		if(isset($_POST['submit'])){
			$name = $_POST['name'];
			$email = $_POST['email'];
			$message = $_POST['message'];
			$to = 'r3000luke@gmail.com';
			$subject = 'Contact Us Form Submission';
			$body = "Name: $name\nEmail: $email\n\nMessage:\n$message";
			$headers = "From: $email\r\nReply-To: $email\r\n";
			if(mail($to, $subject, $body, $headers)){
				echo '<div class="alert alert-success">Thank you for contacting us!</div>';
			} else {
				echo '<div class="alert alert-danger">There was a problem sending your message. Please try again.</div>';
			}
		}
		?>
		<form method="post">
			<div class="form-group">
				<label for="name">Name</label>
				<input type="text" class="form-control" id="name" name="name" required>
			</div>
			<div class="form-group">
				<label for="email">Email address</label>
				<input type="email" class="form-control" id="email" name="email" required>
			</div>
			<div class="form-group">
				<label for="message">Message</label>
				<textarea class="form-control" id="message" name="message" rows="5" required></textarea>
			</div>
			<button type="submit" name="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</body>
<?php require_once 'footer.php'; ?>
</html>
