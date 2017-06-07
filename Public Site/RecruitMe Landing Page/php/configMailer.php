<?php

//Set this for global site use
$site_name = 'RecruitMe';

//EMAIL SETTINGS
//$from_email = 'spudsviz@gmail.com'; //Webmaster email
//$from_name = 'RecruitMe Invite To Beta Request'; //"From name" displayed on email

//Find specific server settings at https://www.arclab.com/en/kb/email/list-of-smtp-and-pop3-servers-mailserver-list.html
$mailServerType = 'smtp';
//IF $mailServerType = 'smtp'
$smtp_server = 'smtp.gmail.com';
$smtp_user = 'spudsviz@gmail.com';
$smtp_pw = 'FLqq7YYw4sT78QX';
$smtp_port = 587; //465 for ssl, 587 for tls, 25 for other
$smtp_security = 'tls';//ssl, tls