<?php
echo("hello");
$userName="pqs";
$repo="blog";
$repoHttpUrl="http://git.aboutme.ink/pqs/blog.git";
$shell = "./deploy.sh ".$userName." ".$repo." ".$repoHttpUrl;
echo $shell;
$log_shell = shell_exec($shell);
echo $log_shell;
?>
