<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<style type=  "text/css">
/*	
	Side Navigation Menu
	===================
	License:
	https://goo.gl/KC3XXj
	===================
	Author: @PableraShow

 */

@import url(http://pablogarciafernandez.com/css/reset.css);

/* Typography
------------------------------------- */
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

body {
  font-family: 'Open Sans', sans-serif;
  font-weight: 300;
  line-height: 1.8em;
  color:#4D4D4D;
}

/* Navigation */

a {
  text-transform: uppercase;
  text-decoration: none;
  color: #151515;
  
  transition-delay: 0s;
  transition-duration: 0.36s;
  transition-property: all;
  transition-timing-function: line;
}

nav a:hover { font-weight: 400; }

nav,
nav:hover { padding: 1em; }

nav a { text-indent: -200px; }

nav:hover a {
  text-indent:0px;
  color: #EEFFE5;
}

svg,
a { vertical-align: top; }

/* End Navigation */


/* Sections */

h1 {
  font-family: 'Open Sans', sans-serif;
  font-size:3em; 
  font-weight: 300;
  color:#000;
  line-height:1.8em;
}

h2 { font-weight: 300; }

h2 a { font-weight: 700; }

/* End Sections */


/* Structure
------------------------------------- */
body { background: #f1f1f1; }

/* Navigation */

nav {
  position: fixed;
  left: 0;
  top: 0;
  bottom: 0;
  display: block;
  height: auto;
  min-width: 40px;
  width: 40px;
  background-color: #8fc1e5;
  
  transition-delay: 0s;
  transition-duration: 0.4s;
  transition-property: all;
  transition-timing-function: line;
}

nav:hover {
  position: fixed;
  left: 0;
  top: 0;
  bottom: 0;
  height: auto;
  width: 140px;
  background-color: #337db3;
}

nav a {
  -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
  filter: alpha(opacity=0);
  opacity:0;
  margin-left: 1em;
}

nav:hover a {
  -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
  filter: alpha(opacity=100);
  opacity:1;
}

li {
  display: block;
  padding:0.2em;
  height:32px;
}

svg,
a { display: inline-block; }

/* End Navigation */

/* Sections */

section { padding: 2em 0 0 14em; }

/* End sections */
</style>
</head>
<body>


<nav>
  <ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Work</a></li>
    <li><a href="#">Contact</a></li>
  </ul></nav>

<section>  
  <h1 align = "center">BIT BOARD GAME</h1>
  <h2>Created with <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="30px" height="30px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve"><path  d="M256,462L53.676,284.644V130.646L169.034,50L256,104.977L342.965,50l115.359,80.646v153.998L256,462z M93.801,266.457L256,408.64l162.198-142.183V151.553l-76.35-53.375L256,152.447l-85.849-54.27l-76.351,53.375V266.457z"/></svg>
 by <a href="http://pablogarciafernandez.com" target="_blank">Pablo García Fernández</a></h2>
</section>
  

</body>
</html>