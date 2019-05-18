<html>
<head>
    <body>
        <p>
            Julian! Don&apos;t forget we need to harden the security on the web server. In case you have forgotten your access details, I&apos;ve put them in a txt file for you. It's in that place where I put that thing that time.
        </p>

        <img src="that-place-where-i-put-that-thing-that-time/565b0f4691fe5.jpg" />

        <p>
            Also, can you fix this search box? Sometimes it chucks errors depending on what I enter...
        </p>
        <p>
            I&apos;d do it myself, but I&apos;ve been busy trying to create some code to enable us to securely store our passwords, seeing as you keep forgetting yours... The encoder seems completely borked though.
        </p>

        <?php
            if ($_POST['username']) {
                echo '<strong>';

                if (strpos($_POST['username'], "'") !== false) {
                    echo "ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '".htmlentities($_POST['username'], ENT_QUOTES)."' at line 1";
                } else {
                    echo 'No users with that name found';
                }

                echo '</strong>';
                echo '<br />';
            }
        ?>

        <form action="reminder.php" method="POST">
            <input type="text" name="username" placeholder="Username">
            <input type="submit" value="Lookup User">
        </form>
    </body>
</html>
