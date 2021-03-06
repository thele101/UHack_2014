<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta name="layout" content="layout_template"/>
				<asset:javascript src="create.js"/>
				<asset:stylesheet src="tables.css"/>
			<!-- hunter probably wants to localize this -->
				<script>
		function init() {
			var stage = new createjs.Stage("can1");			
			var image = new Image();
			image.src = "/images/tree.jpg";
			var bmp = new createjs.Bitmap(image.src);//sub 
			stage.addChild(bmp);
			
			/*var Sepia = new createjs.ColorMatrixFilter([
				0.39, 0.77, 0.19, 0, 0, // red 
				0.35, 0.68, 0.17, 0, 0, //greem
				0.27, 0.53, 0.13, 0, 0, //blue
				0, 0, 0, 1, 0 //alpha
			]);
			bmp.filters = [Sepia] */
			//Sorry if this next part sucks, I'm tired! :)
			createjs.Ticker.addEventListener("tick", handleTick);
			stage.update();
			var oldBmpX = bmp.x;
			var oldBmpY = bmp.y;
			var BmpYIncCounter = 0;
			var threshold = false;
			stage.addChild(bmp);
			var bmp2;
			bmpCount = 1;
			oldBmpY+=50;
			var bmp3 = 0;
			function handleTick(event) {
				if(bmpCount%10==0){
					bmp3 = new createjs.Bitmap("/images/tree.jpg");
					bmp3.x = 233 * parseInt(bmpCount/10);
					bmp3.y = 0;
					stage.addChild(bmp3);
					bmpCount++;
					oldBmpY = 50;
					oldBmpX = 233 * parseInt(bmpCount/10);
				}
				else {
					oldBmpX +=21;
					if(bmpCount %10<=5){
						oldBmpY -=10;
					}
					else
						oldBmpY +=10;
					bmp2 = new createjs.Bitmap("/images/targetflower.png");//was like 19x19
					bmp2.x = oldBmpX;
					bmp2.y = oldBmpY
					bmpCount++;
					stage.addChild(bmp2);
					stage.update();
				}
			}
		}
	</script>
	</head>
	<body onload="init();">

		<div class="colmask doublepage">
			<div class="colleft">
			
				<div class="col1">	
					<div id="rewards" class="bl">
	        			<h2> My Rewards </h2>
	        				<span>&#8226; Target has planted 1 tree on your behalf.</span>
	        				<span>&#8226; You've earned 110 Target Rewards Points and the following coupons:</span>
	        				<div class="coupon">
	        					<div> $5 off any in store purchase </div>
	        				</div>	
	        		</div>
	        		<div id="history" class="bl">
	        			<h2> My Recent Purchases </h2>
	        			<div>No recent purchases....</div>
	        		</div>
	        		<div id="friends" class="bl">
	        			<h2> My Friends' Activity  </h2>
	        			<div id="tweets">
	        				<!-- javascript fills this part of the DOM -->
	        			</div>
	        		</div>
	        		<a href="https://twitter.com/intent/tweet?button_hashtag=greentarget" class="twitter-hashtag-button" data-size="large">Tweet #greentarget</a>
					<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
				</div>		
		
				<div class="col2">
					<div id="progress" class="bl">
	        			<h2> My Progress </h2>	  
						
	        			<div class="meter">
							<span style="width: 43%"></span>
						</div>
					</div> 
  		
	        		<div id="receipts" class="bl">
	        			<h2> Track My Purchases </h2>
	        			<h3> Add Receipt </h3>
	        			<input type="file" name="receipt_input"/>
	        			
	        			<h3> Add a Purchase by Product ID </h3>
	        			<textarea id="productsInput" class="expanding" placeholder="ProductIDs..."></textarea>
	        			<select id="receipt_select">
	        				<option value="14491524,14995030"> Receipt 1 (electronics) </option>
	        				<option value="13531143"> Receipt 2 (up and up)</option>
	        				<option value="13748672"> Lightbulb </option>
	        			</select>
	        			<button id="send_receipt"> Submit receipt </button>	        			        	
	        		</div>
	        		<div id="receipt_wrapper">
	        			<table class="pure-table" id="receipt">
	        			<tr>
	        				<th>Item #</th>
	        				<th>Name</th>
	        				<th>Brand</th>
	        				<th>Price</th>
	        				<th>Green Score</th>
	        			</tr>
	        			</table>
	        		</div>
				</div>				
			</div>
			<div id="temp"></div>
		</div>
		<script>		
		var url = '${createLink(controller:'home', action: 'get_purchase_summary')}';
		$("#productsInput").blur(function(){
			
			$.getJSON(
				url,
				{receipt:$("#productsInput").val()},
				function(data){
					console.log(data)
					do_something_with_data(data)
				}
			)
		})
		$("#send_receipt").click(function(){
			console.log("clicked")
			$.getJSON(
				url,
				{receipt:$("#receipt_select").val()},
				function(data){
					console.log(data)
					do_something_with_data(data)
				}
			)
		});
		
		function update_progress_bar(total_greenscore)
		{
			var progress = Math.round(total_greenscore).toString();
			var meter = $('.meter');
			meter.find('span:first').width(progress + '%');
		}

		
		function do_something_with_data(data)
		{
			update_progress_bar(data.total_greenscore)
			$('#receipt tr:not(:first)').remove()
			var items = data.items
			for (var i = 0; i < items.length; i++)
			{
				$('#receipt tr:last').after(generateRow(items[i],i));
			}
		}

		function generateRow(item, index)
		{
			var html_tr = "";
			html_tr = "<tr><td>" + index.toString() + "</td>"
			html_tr += "<td>" + item.product_name + "</td>"
			html_tr += "<td>" + item.product_brand + "</td>"
			html_tr += "<td>$" + item.product_price.toString() + "</td>"
			html_tr += "<td>" + (Math.round(item.product_greenscore*10)/10).toString() + "</td>"
			html_tr += "</tr>"
			return html_tr		
		}
		</script>
		
	<g:javascript>
        $(document).ready(function(){
			searchTwitter('#greentarget');
        });
        
        // this requires an api key which we don't have for UHack
		function searchTwitter(query) {
			if (query === '#greentarget') {
				doFakeTwitterQuery();
				return;
			}
			$.ajax({
		        	url: 'http://search.twitter.com/search.json?q=' + query,
		        	dataType: 'jsonp',
		        	success: fillTwitterWidget(data)
		    });
		}
		
		function fillTwitterWidget(data) {
	            var tweets = $('#tweets');
	            tweets.html('');
	            for (res in data['results']) {
	                tweets.append('<div>' + data['results'][res]['from_user'] + ' wrote: <p>' + data['results'][res]['text'] + '</p></div><br />');
	            }
	  	}

		function doFakeTwitterQuery() {
            var tweets = $('#tweets');
            tweets.html('');            
            tweets.append('<div class="tweet"> <div class="tweet-left"> <a target="_blank" href="http://twitter.com"><img width="24" height="24" alt="Profile picture on Twitter" src="http://www.photocase.com/stock-photos/140466-stock-photo-man-colour-face-eyes-portrait-photograph-nose.jpg" /></a></div><div class="tweet-right"><p class="text">John Lucas tweets: all about the green score #greentarget </p></div><br style="clear: both;" /></div>');
           	tweets.append('<div class="tweet"> <div class="tweet-left"> <a target="_blank" href="http://twitter.com"><img width="24" height="24" alt="Profile picture on Twitter" src="http://th09.deviantart.net/fs36/PRE/i/2008/245/f/4/Female_face___STOCK_by_paronomasiaSTOCK.jpg" /></a></div><div class="tweet-right"><p class="text">Sara Sanders tweets: Shopping at target just got awesome #greentarget </p></div><br style="clear: both;" /></div>');
			tweets.append('<div class="tweet"> <div class="tweet-left"> <a target="_blank" href="http://twitter.com"><img width="24" height="24" alt="Profile picture on Twitter" src="http://th06.deviantart.net/fs9/PRE/i/2006/007/2/5/Face_Neck_and_Nugget_15_by_Ahrum_Stock.jpg" /></a></div><div class="tweet-right"><p class="text">Mo Patterson wrote: Target is poppin. Turn down for wut #greentarget #SunsOutGunsOut </p></div><br style="clear: both;" /></div>');
		}
		
		// Expanding Textareas
		// https://github.com/bgrins/ExpandingTextareas
		
		(function(factory) {
		    // Add jQuery via AMD registration or browser globals
		    if (typeof define === 'function' && define.amd) {
		        define([ 'jquery' ], factory);
		    }
		    else {
		        factory(jQuery);
		    }
		}(function ($) {
		    $.expandingTextarea = $.extend({
		        autoInitialize: true,
		        initialSelector: "textarea.expanding",
		        opts: {
		            resize: function() { }
		        }
		    }, $.expandingTextarea || {});
		
		    var cloneCSSProperties = [
		        'lineHeight', 'textDecoration', 'letterSpacing',
		        'fontSize', 'fontFamily', 'fontStyle',
		        'fontWeight', 'textTransform', 'textAlign',
		        'direction', 'wordSpacing', 'fontSizeAdjust',
		        'wordWrap', 'word-break',
		        'borderLeftWidth', 'borderRightWidth',
		        'borderTopWidth','borderBottomWidth',
		        'paddingLeft', 'paddingRight',
		        'paddingTop','paddingBottom',
		        'marginLeft', 'marginRight',
		        'marginTop','marginBottom',
		        'boxSizing', 'webkitBoxSizing', 'mozBoxSizing', 'msBoxSizing'
		    ];
		
		    var textareaCSS = {
		        position: "absolute",
		        height: "100%",
		        resize: "none"
		    };
		
		    var preCSS = {
		        visibility: "hidden",
		        border: "0 solid"
		    };
		
		    var containerCSS = {
		        position: "relative"
		    };
		
		    function resize() {
		        $(this).closest('.expandingText').find("div").text(this.value.replace(/\r\n/g, "\n") + ' ');
		        $(this).trigger("resize.expanding");
		    }
		
		    $.fn.expandingTextarea = function(o) {
		
		        var opts = $.extend({ }, $.expandingTextarea.opts, o);
		
		        if (o === "resize") {
		            return this.trigger("input.expanding");
		        }
		
		        if (o === "destroy") {
		            this.filter(".expanding-init").each(function() {
		                var textarea = $(this).removeClass('expanding-init');
		                var container = textarea.closest('.expandingText');
		
		                container.before(textarea).remove();
		                textarea
		                    .attr('style', textarea.data('expanding-styles') || '')
		                    .removeData('expanding-styles');
		            });
		
		            return this;
		        }
		
		        this.filter("textarea").not(".expanding-init").addClass("expanding-init").each(function() {
		            var textarea = $(this);
		
		            textarea.wrap("<div class='expandingText'></div>");
		            textarea.after("<pre class='textareaClone'><div></div></pre>");
		
		            var container = textarea.parent().css(containerCSS);
		            var pre = container.find("pre").css(preCSS);
		
		            pre.css(textarea.attr("wrap") === "off" ? {overflowX: "scroll"} : {whiteSpace: "pre-wrap"});
		
		            // Store the original styles in case of destroying.
		            textarea.data('expanding-styles', textarea.attr('style'));
		            textarea.css(textareaCSS);
		
		            $.each(cloneCSSProperties, function(i, p) {
		                var val = textarea.css(p);
		
		                // Only set if different to prevent overriding percentage css values.
		                if (pre.css(p) !== val) {
		                    pre.css(p, val);
		                }
		            });
		            container.css({"min-height": textarea.outerHeight(true)});
		
		            textarea.bind("input.expanding propertychange.expanding keyup.expanding change.expanding", resize);
		            resize.apply(this);
		
		            if (opts.resize) {
		                textarea.bind("resize.expanding", opts.resize);
		            }
		        });
		
		        return this;
		    };
		
		    $(function () {
		        if ($.expandingTextarea.autoInitialize) {
		            $($.expandingTextarea.initialSelector).expandingTextarea();
		        }
		    });
		
		}));
		
    </g:javascript>

		
	</body>

</html>