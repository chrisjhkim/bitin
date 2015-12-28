$(window).load(function(){
    //Welcome Message (not for login page)
    function notify(message, type){
        $.growl({
            message: message
        },{
            type: type,
            allow_dismiss: false,
            label: 'Cancel',
            className: 'btn-sm btn-inverse',
            placement: {
                from: 'top',
                align: 'center'
            },
            delay: 2500,
            animate: {
                    enter: 'animated fadeIn',
                    exit: 'animated fadeOut'
            },
            offset: {
                x: 20,
                y: 85
            }
        });
    };
    
    if (!$('.login-content')[0]) {
    	if( authUser != "" ) {
    		notify( authUser +' 님 환영합니다' , 'success');
    	}
    } 
});