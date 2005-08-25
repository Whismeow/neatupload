<%@ Page language="c#" Codebehind="Demo.aspx.cs" AutoEventWireup="false" Inherits="Brettle.Web.NeatUpload.Demo" %>
<%@ Register TagPrefix="Upload" Namespace="Brettle.Web.NeatUpload" Assembly="Brettle.Web.NeatUpload" %>

<Html>
	<Head>
		<Title>NeatUpload Demo</Title>
		<style type="text/css">
<!--
		.ProgressBar {
			margin: 0px;
			border: 0px;
			padding: 0px;
			width: 100%;
			height: 2em;
		}
-->
		</style>
	</Head>
	<Body>
		<form id="uploadForm" runat="server">
			<h1>NeatUpload Demo</h1>
			<p>
			This page demonstrates the basic functionality of <a href="http://www.brettle.com/neatupload/">NeatUpload</a>.
			Select a file and click Submit. You will see <strong>both</strong> an inline progress bar and a popup 
			progress bar.  Of course you would normally use just one or the other.
			</p>
			<p>
			NeatUpload stores your upload in a temporary file on the server and
			automatically deletes it when your request completes.  This demo just displays the file's name,
			size, and content type.  A real application would move or copy the file to its permanent location.  
			</p>
			<p>
			Pick a file: <Upload:InputFile id="inputFile" runat="server" />
			<asp:Button id="submitButton" runat="server" Text="Submit" />
			<br />
			<pre id="bodyPre" runat="server">
			
			</pre>
			</p>
			<h2>Inline Progress Bar</h2>
			<p>
			Here's the inline progress bar:
			<Upload:ProgressBar id="inlineProgressBar" runat="server" inline="true" />
			The inline progress bar is an IFRAME.  If your browser doesn't support IFRAMEs, you'll see a link to
			display the progress bar in a new window.  The text of that link is configurable.
			</p> 

			<h2>Popup Progress Bar</h2>
			<p>
			Here's what is generated by a ProgressBar control configured to display a popup:
			</p> 
			<Upload:ProgressBar id="progressBar" runat="server" >
				<asp:Label id="label" runat="server" Text="Check Progress"/>
			</Upload:ProgressBar>
			<p>
			<strong>What?  You don't see anything?</strong>  That's because you have JavaScript enabled.  With JavaScript
			enabled, the popup is shown automatically when you submit the form, so there is no need to display anything
			extra on this page. 	If you disable JavaScript, you will see a "Check Progress" link which you can click
			on to display the progress bar in a new window.  The text of that link is configurable.
			</p>
			
			<h2>Cancelling Uploads</h2>
			<p>
			You can cancel your upload by either clicking your browser's Stop button or clicking the Cancel button that
			is displayed to the right of the progress bar when the upload is in progress.
			</p>
			
		</form>
	</Body>
</Html>
