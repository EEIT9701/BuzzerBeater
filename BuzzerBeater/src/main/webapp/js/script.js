
$(function () {
	
    var note = $('#note'),
        //����ɶ�
		//OutTime = new Date("2017/11/17"),
        ts = new Date("2017/11/17").getTime(),
        newYear = true;

	$('#countdown').countdown({
		timestamp	: ts,

		callback	: function(days, hours, minutes, seconds){
		    console.log(new Date(ts))
			var message = "";
			
			message += days + " ��" + (days == 1 ? '' : '') + ", ";	
			message += hours + " ��" + ( hours==1 ? '':'' ) + ", ";
			message += minutes + " ��" + ( minutes==1 ? '':'' ) ;
			message += seconds + " ��" + ( seconds==1 ? '':'' ) + " <br />";

			if (ts <= (new Date().getTime())) {
			    console.log("3-a");
			    message += "���W�w�I��QQ";
			}
			else {
			    console.log("3-b");
				message += "���W�˼Ƥ�";
			}

			note.html(message);

		}
	});
	
});
