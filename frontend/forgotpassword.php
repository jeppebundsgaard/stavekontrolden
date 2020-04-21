<?php
// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
$relative="../";
include_once($relative."/settings/conf.php");

$q='select username,email from users where email="'.filter_var($_POST["email"],FILTER_SANITIZE_EMAIL).'"';
$result=$mysqli->query($q);
if ($result->num_rows<1) $warning=_('We couldn\'t find a  user with that e-mail address.');
else {
	$r=$result->fetch_assoc();
	for ($s = '', $i = 0, $z = strlen($a = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789')-1; $i != 32; $x = rand(0,$z), $s .= $a{$x}, $i++); 
	$link=$baseurl."/?newpass=".$s;
// 	$log.=$link;
	// Load Composer's autoloader
	require $relative.'vendor/autoload.php';

	$secrets=explode("\n",file_get_contents($relative."../secrets/.htmail"));

	// Instantiation and passing `true` enables exceptions
	$mail = new PHPMailer(true);

	try {
		//Server settings
		$mail->SMTPDebug = 0;                                       // Enable verbose debug output
		$mail->isSMTP();                                            // Set mailer to use SMTP
		$mail->Host       = $secrets[0];							  // Specify main and backup SMTP servers
		$mail->SMTPAuth   = true;                                   // Enable SMTP authentication
		$mail->Username   = $secrets[1];                     // SMTP username
		$mail->Password   = $secrets[2];                               // SMTP password
		$mail->SMTPSecure = 'tls';                                  // Enable TLS encryption, `ssl` also accepted
		$mail->Port       = 587;                                    // TCP port to connect to

		//Recipients
		$mail->setFrom('support@'.$baseurl, _('Stavekontrolden Support'));
		$mail->addAddress($_POST["email"]);               // Name is optional

		// Content
		$mail->isHTML(true);                                  // Set email format to HTML
		$mail->Subject = _('Create a new password');
		$mail->Body    = sprintf(_('Hello %1$s,<br>Someone asked for a new password for Stavekontrolden. If it was not you, please disregard this e-mail.<p>Please click on this link to create a new password:</p><p><a href="%2$s">%2$s</a></p>'),$r["username"],$link);

		$mail->send();
	//     echo 'Message has been sent';
	} catch (Exception $e) {
		$warning=_("Message could not be sent. Mailer Error: {$mail->ErrorInfo}");
	}
 	if(!$warning) file_put_contents($relative."../newpass/".$s,$_POST["email"]);
}
echo json_encode(array("warning"=>$warning,"log"=>$log));
