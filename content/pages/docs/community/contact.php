<?php
    $name = $_POST['Name'];
    $vistor_email = $_POST['Email'];
    $issue = $_POST['Issue'];
    $message = $_POST['Message'];

    $email_from = 'support@evase.net';

    $email_subject = "New form submission";

    $email_body = "User Name: $name.\n".
                    "User Email: $visitor_email.\n".
                       "User Issue: $issue.\n".
                          "User Message: $message.\n";

    $to = "admin@evase.net";

    $headers = "From: $email_from \r\n";

    $headers .= "Reply-To: $vistor_email \r\n";

    mail($to,$email_subject,$email_body,$headers);

    header("Location: /content/pages/docs/community/index.md");


?>