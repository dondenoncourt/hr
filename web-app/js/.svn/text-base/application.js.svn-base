/* Daffron - HR */
if (typeof jQuery !== 'undefined') { // doesn't seem to work...
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}
//var Ajax;
//if (Ajax && (Ajax != null)) {
//	Ajax.Responders.register({
//	  onCreate: function() {
//        if($('spinner') && Ajax.activeRequestCount>0)
//          Effect.Appear('spinner',{duration:0.5,queue:'end'});
//	  },
//	  onComplete: function() {
//        if($('spinner') && Ajax.activeRequestCount==0)
//          Effect.Fade('spinner',{duration:0.5,queue:'end'});
//	  }
//	});
//}

function enrollConfirmToUpdateSubmitText() {
	$('form input').change(function () {
		this.form.changed.value = 'true';
		var updBtn = $('#pageUpdateButton');
		if (updBtn.is('a')){
			$('#pageUpdateButton').html('Update and Next');
		} else if (updBtn.is('input')) {
			$('#pageUpdateButton').val('Update and Next');
		}
	});
}
