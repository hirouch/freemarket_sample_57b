jQuery(function($){
	$(".haya-address-from").validate({
		  rules : {
				"user[address_last_name]": {
					required: true
				 },
		  },
		  messages: {
        "user[address_last_name]":{
						required: "必須項目です。入力をお願いします。"
				 },
		  }
	});
});