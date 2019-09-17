jQuery(function($){
	$(".phone-number-form").validate({
		  rules : {
				"user[phone_number]": {
					required: true
         },
		  },
		  messages: {
        "user[phone_number]":{
						required: "必須項目です。入力をお願いします。"
         },
		  }
	});
});

jQuery(function($){
	$(".haya-address-from").validate({
		  rules : {
				"user[address_attributes][address_last_name]": {
					required: true
         },
         "user[address_attributes][address_first_name]": {
					required: true
         },
         "user[address_attributes][address_last_name_kana]": {
					required: true
         },
         "user[address_attributes][address_first_name_kana]": {
					required: true
         },
         "user[address_attributes][address_number]": {
					required: true
         },
         "user[address_attributes][address_prefecture]": {
					required: true
         },
         "user[address_attributes][address_name]": {
					required: true
         },
         "user[address_attributes][address_block]": {
					required: true
         },
         "user[address_attributes][address_building]": {
					required: true
         },
         "user[address_attributes][address_phone_number]": {
					required: true
         },
		  },
		  messages: {
        "user[address_attributes][address_last_name]":{
						required: "必須項目です。入力をお願いします。"
         },
         "user[address_attributes][address_first_name]":{
          required: "必須項目です。入力をお願いします。"
        },
        "user[address_attributes][address_last_name_kana]":{
          required: "必須項目です。入力をお願いします。"
      },
      "user[address_attributes][address_first_name_kana]":{
        required: "必須項目です。入力をお願いします。"
    },
    "user[address_attributes][address_number]":{
      required: "必須項目です。入力をお願いします。"
  },
  "user[address_attributes][address_prefecture]":{
    required: "必須項目です。入力をお願いします。"
},
"user[address_attributes][address_name]":{
  required: "必須項目です。入力をお願いします。"
},
"user[address_attributes][address_block]":{
  required: "必須項目です。入力をお願いします。"
},
"user[address_attributes][address_building]":{
  required: "必須項目です。入力をお願いします。"
},
"user[address_attributes][address_phone_number]":{
  required: "必須項目です。入力をお願いします。"
},
		  }
	});
});