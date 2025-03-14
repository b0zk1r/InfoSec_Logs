FILE UPLOAD VULNERABILITIES
In this section, we will cover how to use file upload functionalities to gain code execution.

In web applications (especially the ones using the file systems to determine what code should be run), you can get code execution on a server, if you manage to upload a file with the right filename (often depending on the extension). In this section, we will see the basics of these types of attacks.

First, since we are working on a PHP application, we will need a PHP web shell. A web shell is just a simple script or web application that runs the code or commands provided. For example, in PHP, the following code is a really simple web shell:

<?php
  system($_GET["cmd"]);
?>

More complex web shells can perform advanced operations, such as providing database and file system access, or even TCP tunnelling.

The first example is a really basic upload form, with no restriction. By using the web shell above, and naming it with a .php extension you should be able to get it upload onto the server. Once it's uploaded, you can access the script (with the parameter cmd=uname for example) to get command execution.

example.com/upload/PHP_Web_Shell.php?cmd=uname -a


File Upload 02

In this second example, the developer put a restriction on the file name. The file name cannot end with .php. To bypass this restriction, you can simply rename the file to .php3 for example (since the server will load file with this extension as PHP file).




