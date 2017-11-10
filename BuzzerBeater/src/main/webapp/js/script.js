
$(function () {
	
    var note = $('#note'),
        //����ɶ�
		//OutTime = new Date("2017/11/17"),
        ts = new Date("2017/11/18").getTime(),
        newYear = true;

	$('#countdown').countdown({
		timestamp	: ts,

		callback	: function(days, hours, minutes, seconds){
		    console.log(new Date(ts))
			var message = "";
			
			message += days + " 天" + (days == 1 ? '' : '') + ", ";	
			message += hours + " 時" + ( hours==1 ? '':'' ) + ", ";
			message += minutes + " 分" + ( minutes==1 ? '':'' ) ;
			message += seconds + " 秒" + ( seconds==1 ? '':'' ) + " <br />";

			if (ts <= (new Date().getTime())) {
			    console.log("3-a");
			    message += "報名已截止QQ";
			}
			else {
			    console.log("3-b");
				message += "報名倒數中";
			}

			note.html(message);

		}
	});
	
});
