console.log("Rereply Module.......");

var rereplyService = (function(){

	function add(rereply, callback, error){
	console.log("add rereply........");
	
	
	$.ajax({
		type : 'post',
		url : '/studioRereplies/new',
		data : JSON.stringify(rereply),
		contentType : "application/json; charset=utf-8",
		success : function(result, status, xhr){
			if(callback) {
				callback(result);
			}
		},
		error : function(xhr, status, er) {
		if (error) {
			error(er);
			}
		}
		})
	}
	
	
	function getList(param, callback, error){
		
		var rno = param.rnoValue;
		var page = param.page || 1;
		
		$.getJSON("/studioRereplies/pages/" + rno + "/" + page + ".json",
			function(data){
				if (callback) {
					//callback(data.list);	//댓글 목록만 가져오는 경우  이걸쓰자!
					callback(data.rereplyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우
					}
				}).fail(function(xhr,status, err) {
				if (error) {
				 error();
				 }
				});
			}

	function remove(rrno, rereplyer, callback, error){
		$.ajax({
			type : 'delete',
			url : '/studioRereplies/' + rrno,
			
			data: JSON.stringify({rrno:rrno, rereplyer:rereplyer}),
			
			contentType: "application/json; charset=utf-8",
			
			success : function(deleteResult, status, xhr){
				if (callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
			
	
	function update(rereply, callback, error){
	
		console.log("RRNO : " + rereply.rrno);
		
		$.ajax({
			type : 'put',
			url : '/studioRereplies/' + rereply.rrno,
			data : JSON.stringify(rereply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if (callback) {
					callback(result);
					}
				},
				error : function(xhr, status,er) {
					if (error) {
						error(er);
						}
					}
				});
			}	
			
	function get(rrno, callback, error){
		$.get("/studioRereplies/" + rrno + ".json", function(result) {
			if (callback) {
				callback(result);
				}
			}).fail(function(xhr, status, err) {
				if (error) {
					error();
					}
				});
			}
			
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		if (gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss ].join('');
				
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
			}
		}
		;
			
			

	return {
		add:add,
		get : get,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
		};
	})();
