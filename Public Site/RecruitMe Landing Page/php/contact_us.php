<?php
require 'PHPMailer/PHPMailerAutoload.php';
include_once 'configMailer.php';

$from_email = $_POST['email'];
$contactmessage = 'Hi there! ' . $from_email . ' would like to request access to the RecruitMe Beta User Group!';

if (!filter_var($from_email, FILTER_VALIDATE_EMAIL) == true) {

    echo '<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Must provide a valid email address</div><div id="returnVal" style="display:none;">false</div>';

} else {
    $fromname = 'RecruitMe Landing Page';
    $mail = new PHPMailer;
    $mail->isHTML(true);
    $mail->CharSet = "text/html; charset=UTF-8;";
    $mail->WordWrap = 80;
    $mail->setFrom($from_email, $fromname);
    $mail->AddReplyTo($from_email, $fromname);
    /****
    * Set who the message is to be sent to
    * CAN BE SET TO addAddress(youremail@website.com, 'Your Name') FOR PRIVATE USER APPROVAL BY MODERATOR
    * SET TO addAddress($email, $user) FOR USER SELF-VERIFICATION
    *****/
    $mail->addAddress('coby.benveniste@gmail.com', 'RecruitMe Invite To Beta');
    //Set the subject line
    $mail->Subject = 'RecruitMe Invite To Beta Request';

    //Set the body of the message
    $mail->Body = 'Email: ' . $from_email . '<br>Message: ' . $contactmessage;

    $mail->AltBody = 'Email: ' . $from_email . ' -- Message: ' . $contactmessage;

    //SMTP Settings
    if ($mailServerType == 'smtp') {

        $mail->IsSMTP(); //Enable SMTP
        $mail->SMTPAuth = true; //SMTP Authentication
        $mail->Host = $smtp_server; //SMTP Host
        //Defaults: Non-Encrypted = 25, SSL = 465, TLS = 587
        $mail->SMTPSecure = $smtp_security; // Sets the prefix to the server
        $mail->Port = $smtp_port; //SMTP Port
        //SMTP user auth
        $mail->Username = $smtp_user; //SMTP Username
        $mail->Password = $smtp_pw; //SMTP Password
        //********************
        $mail->SMTPDebug = 0; //Set to 0 to disable debugging (for production)

    }

    try {

        $mail->Send();
        echo '<div class="col-sm-8 col-sm-offset-2 text-center wow fadeIn" data-wow-delay="0.2s"><hr  class="line blue"><h3>Thank You!</h3><p>Thanks for requesting access to the beta! We will get back to you as soon as possible!</p></div><div id="returnVal" style="display:none;">true</div>';


    } catch (phpmailerException $e) {
        echo '<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Error Sending Email: ' . $e->errorMessage() . '</div><div id="returnVal" style="display:none;">false</div>';


    } catch (Exception $e) {
        echo '<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Error Sending Email: ' . $e->getMessage() . '</div><div id="returnVal" style="display:none;">false</div>';
    }
};
