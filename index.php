<!DOCTYPE html>
<!-- //git pull https://github.com/wdomi/MyApp.git -->
<!-- git push --set-upstream https://github.com/wdomi/MyApp.git master -->

<html lang="en">


    <head>
        <meta charset="UTF-8">

        <title>This is my Webpage</title>

        <!-- // + ---------- Upload files (CSS, JavaScript, PHP,...) ---------- -->
        <script type="text/javascript" src="d3.min.js">
        </script>
        <!-- <script src="http://d3js.org/d3.v3.min.js" language="JavaScript"></script> -->
        <!-- reference to JavaScript scripts file: <script type="text/javascript" src="myscript.js"></script> -->
        <!-- or you can reference to a .css style file: <link rel="stylesheet" href="style.css"> -->

        <!-- // + ---------- CSS style settings ------------------------------- -->
        <style type="text/css">
            body {
                background-color: white;
                color: black;
                margin: 10px;
                padding: 25px;
            }

            p {
                font-family: sans-serif;
                font-size: 14px;
                line-height: 14px;
                color: limegreen;
            }

            p2 {
                font-family: sans-serif;
                font-size: 14px;
                line-height: 14px;
                color: blue;
            }
        </style>

    </head>

    <body>

        <h1> This is my page title </h1>

        <p> Hello my <em>friend</em>, this is my <strong>first</strong> paragraph!
            <br> <br>
        </p>

        <p> This is today's date generated with php:
            <table bgcolor='lightgreen'>
                <tr>
                    <td>
                        <?php
                        echo date('d.m.Y');  // this gives today's date in PHP
                        ?>
                    </td>
                </tr>
            </table>
        </p>

        <hr> <!-- --------------- this is a line ----------------------- -->

        <p2> This is a SVG vector graphic visual <br>
            <svg width="720" height="120">
                <circle cx="40" cy="60" r="10"></circle>
                <circle cx="80" cy="60" r="10"></circle>
                <circle cx="120" cy="60" r="10"></circle>
            </svg>

            <script language="JavaScript">
                var circle = d3.selectAll("circle");
                circle.style("fill", "steelblue");
                circle.attr("r", 30);
                circle.attr("cx", function() {
                    return Math.random() * 720;
                });
            </script>
        </p2>

        <?php 
        include 'element_footer.php';
        ?>

    </body>

</html>