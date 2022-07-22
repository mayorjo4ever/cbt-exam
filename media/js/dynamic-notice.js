

		function dyn_notice() {
			var percent = 0;
			var notice = new PNotify({
				text: "Please Wait",
				type: 'info',
				icon: 'fa fa-spinner fa-spin',
				hide: false,
				buttons: {
					closer: false,
					sticker: false
				},
				opacity: .75,
				shadow: false,
				width: "170px"
			});

			setTimeout(function() {
				notice.update({
					title: false
				});
				var interval = setInterval(function() {
					percent += 2;
					var options = {
						text: percent + "% complete."
					};
					if (percent == 80) options.title = "Almost There";
					if (percent >= 100) {
						window.clearInterval(interval);
						options.title = "Done!";
						options.type = "success";
						options.hide = true;
						options.buttons = {
							closer: true,
							sticker: true
						};
						options.icon = 'fa fa-check';
						options.opacity = 1;
						options.shadow = true;
						options.width = PNotify.prototype.options.width;
					}
					notice.update(options);
				}, 120);
			}, 2000);
		}

		/***************************************************************************/
		// desktop notification info 
		/**************************************************************************/
		PNotify.desktop.permission();
		(new PNotify({
			title: 'Desktop Info',
			text: 'If you\'ve given me permission, I\'ll appear as a desktop notification. If you haven\'t, I\'ll still appear as a regular PNotify notice.',
			type: 'info',
			desktop: {
				desktop: true
			}
		})).get().click(function(e) {
			if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target)) return;
			alert('Hey! You clicked the desktop notification!');
		});
		/***************************************************************************/

		/***************************************************************************/
		// desktop notification success 
		/**************************************************************************/
		PNotify.desktop.permission();
		(new PNotify({
			title: 'Desktop Success',
			text: 'If you\'ve given me permission, I\'ll appear as a desktop notification. If you haven\'t, I\'ll still appear as a regular PNotify notice.',
			type: 'success',
			desktop: {
				desktop: true
			}
		})).get().click(function(e) {
			if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target)) return;
			alert('Hey! You clicked the desktop notification!');
		});

		//
		/***************************************************************************/
		// desktop notification error 
		/**************************************************************************/
		PNotify.desktop.permission();
		(new PNotify({
			title: 'Desktop Error',
			text: 'If you\'ve given me permission, I\'ll appear as a desktop notification. If you haven\'t, I\'ll still appear as a regular PNotify notice.',
			type: 'error',
			desktop: {
				desktop: true
			}
		})).get().click(function(e) {
			if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target)) return;
			alert('Hey! You clicked the desktop notification!');
		});
		//
		/***************************************************************************/
		// desktop notification success 
		/**************************************************************************/