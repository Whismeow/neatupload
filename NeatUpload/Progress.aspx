<%@ Page language="c#" Codebehind="Progress.aspx.cs" AutoEventWireup="false" Inherits="Brettle.Web.NeatUpload.Progress" %>
<Html>
	<Head>
		<Title>Upload Progress</Title>
		<link rel="stylesheet" type="text/css" title="default" href="default.css" />		
		<style type="text/css">
<!--
		body, form, table {
			margin: 0px;
			border: 0px none;
			padding: 0px;
		}

		table {
			vertical-align: middle;
			width: 100%;
			height: 100%;
		}
		
		#barTd {
			width: 100%;
		}
		
		#statusDiv {
			border-width: 1px;
			border-style: solid;
			padding: 0px;
			position: relative;
			width: 100%;
			text-align: center;
			z-index: 1; 
		}
		
		#barDiv {
			border: 0px none ; 
			margin: 0px; 
			padding: 0px; 
			position: absolute; 
			top: 0pt; 
			left: 0pt; 
			z-index: -1; 
			height: 100%;
			width: 75%;
		}
		
		<%= DynamicStyle %>
-->
		</style>
	</Head>
	<Body>
		<form id="dummyForm" runat="server">
		<table class="ProgressDisplay">
		<tr>
		<td>
			<span id="label" runat="server" class="Label">Upload&nbsp;Status:</span>
		</td>
		<td id="barTd" >
			<div id="statusDiv" runat="server" class="StatusMessage">&nbsp;
				<span id="completedSpan" runat="server">Complete: </span>
				<span id="cancelledSpan" runat="server">Cancelled: </span>
				<span id="rejectedSpan" runat="server">Rejected: <span id="rejectedMessageSpan" runat="server"></span></span>
				<span id="errorSpan" runat="server">Error: <span id="errorMessageSpan" runat="server"></span></span>
				<span class="UploadDetails" style="font-weight: normal; white-space: nowrap;">
					<span id="uploadedCountSpan" runat="server">0</span><span class="HaveTotalCount">/<span id="totalCountSpan" runat="server">0</span></span>
					<span id="countUnitsSpan" runat="server">KB</span>
					<span class="HaveTotalCount">(<span id="percentCompleteSpan" runat="server">0%</span>)</span>
					at <span id="rateSpan" runat="server">0 KB/s</span>
					<span id="inProgressSpan" runat="server">- <span id="remainingTimeSpan" runat="server">00:01 left</span><span id="elapsedTimeSpan" runat="server">00:01 elapsed</span></span>
				</span>
				<div id="barDiv" runat="server" class="ProgressBar"></div>
			</div>
		</td>
		<td>
			<a id="cancelLink" runat="server" title="Cancel Upload" class="ImageButton"><img id="cancelImage" runat="server" src="cancel.png" alt="Cancel Upload" /></a>
			<a id="refreshLink" runat="server" title="Refresh" class="ImageButton"><img id="refreshImage" runat="server" src="refresh.png" alt="Refresh" /></a>
			<a id="stopRefreshLink" runat="server" title="Stop Refreshing" class="ImageButton"><img id="stopRefreshImage" runat="server" src="stop_refresh.png" alt="Stop Refreshing" /></a>
		</td>
		</tr>
		</table>
		</form>
	</Body>
</Html>
