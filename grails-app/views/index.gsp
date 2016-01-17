<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Bethel</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}
			
			#left { 
				float: left; 
				width: 192px; 
				background: #ECE5B6; 
				margin-bottom: 5px; 
				margin-top: 5px;
				font-size: 1em
			}
			
			#page-body {
				margin: 1em 1em 1.25em 14em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}
						
			h3 {
				margin-top: 0.2em;
				margin-bottom: 0.2em;
				font-size: 1em;
				width: 12em
			}

			p {
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
			
			#menu {
				background: #333;
				float: left;
				list-style: none;
				margin: 0;
				padding: 0;
				width: 12em;
			}
			#menu li {
				font: 68.5% "Lucida Sans Unicode", "Bitstream Vera Sans", "Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica, sans-serif;
				margin: 0;
				padding: 0;
			}
			#menu a {
				background: #333;
				border-bottom: 1px solid #393939;
				color: #ccc;
				display: block;
				margin: 0;
				padding: 8px 12px;
				text-decoration: none;
			}
			#menu a:hover {
				background: #2580a2 url("images/hover.gif") left center no-repeat;
				color: #fff;
				padding-bottom: 8px;
			}
			#welcome_message {
				font: 80% "Bitstream Vera Sans"
			}
			
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="left" role="navigation">
			<h3>Menu</h3>
			<ul id="menu">
				<li class="controller">
					<g:link controller="logout">Logout</g:link>
				</li>
				<li class="controller">
					<g:link controller="organisation">Organisations</g:link>
				</li>
				<li class="controller">
					<g:link controller="assembly">Assemblies</g:link>
				</li>
				<li class="controller">
					<g:link controller="cellGroup">Cell Groups</g:link>
				</li>
				<li class="controller">
					<g:link controller="family">Families</g:link>
				</li>
				<li class="controller">
					<g:link controller="member">Members</g:link>
				</li>
				<li class="controller">
					<g:link controller="department">Departments</g:link>
				</li>
				<li class="controller">
					<g:link controller="fellowshipGroup">Fellowship Groups</g:link>
				</li>
				<li class="controller">
					<g:link controller="project">Projects</g:link>
				</li>
				<li class="controller">
					<g:link controller="pledge">Pledges</g:link>
				</li>
				<li class="controller">
					<g:link controller="receipt">Receipts</g:link>
				</li>
				<li class="controller">
					<g:link controller="ageGroup">Age Groups</g:link>
				</li>
				<li class="controller">
					<g:link controller="position">Positions</g:link>
				</li>
			</ul>
		</div>
		<div id="page-body" role="main">
			 <h1>Welcome to Bethel, The House of God</h1>
			 
			<div id="welcome_message" style="font-size: 8">
	            <br/>
	            <p>
	            	I am the resurrection and the life. Whoever believes in me, though he die, <br/>
	            	yet shall he live, and everyone who lives and believes in me shall never die.       	
				</p>			
				
				<p><br/>	
					 [For] In the beginning was the Word, and the Word was with God, and the Word was God. <br/>
					 He was in the beginning with God.  All things were made by him, and for him, <br/>
					 and without him was not any thing made that was made.  In him was life, <br/>
					 and the life was the light of men.  The light shines in the darkness, 
					 and the darkness has not overcome it. 
				</p>
						
				<p><br/>
					And the Word became flesh and dwelt among us, and we have seen his glory, <br/>
					glory as of the only Son from the Father, full of grace and truth.
				</p>
				
				<br/>
				
				[John 1:1-5,14; 11:25]
				
			</div>					
		</div>
	</body>
</html>
