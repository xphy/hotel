$(function () {
    setSlip();

    $('.container figure img').mouseenter(function () {
        $(this).animate({
            opacity:1
        },300);
    });
    $('.container figure img').mouseleave(function () {
        $(this).stop().animate({
            opacity:0.5
        },300);
    });
    //header����border-bottom��ɫ�ı仯��������a������.active����ʾ������ΪĬ����ɫ
    //alert($('.nav li a').hasClass("active"));
    if($('.nav li a').hasClass("active") ==true){
        $('#header').css('border-bottom','2px brown solid');
    }

    //newslistҳ��.container .list li������ɫ
    $('.container .list li:odd').css('background','#EEE');
    $('.container .list li').first().css('marginTop','10px');
    
    $('.container .list li').hover(function () {
        $(this).addClass('c_hover');
    },function () {
        $(this).removeClass('c_hover');
    });
    //���������С��һ�������Ҫ���li�ĸ߶ȣ����ҽ�lineheight����Ϊli�ĸ߶ȣ��Ѵﵽ���崹ֱ����
    var li_element = $('.container .list li');
    var li_height = li_element.height()+'px';
    li_element.css('lineHeight',li_height);

    //�������������С�任
    $('#font-mx').click(function () {
        $('.container .content').css('fontSize','16px');
    });
    $('#font-lx').click(function () {
        $('.container .content').css('fontSize','14px');
    });
    $('#font-sx').click(function () {
        $('.container .content').css('fontSize','12px');
    });



    //������½��
    $('.login li.login_windows').click(function () {
        $('#login').css({
            top:'50%',
            left:'50%',
            margin:'-'+($('#login').height()/2 +'px 0 0 -'+$('#login').width()/2)+'px',
            zIndex:999
        }).slideDown(300);
        $('body').css({overflow:"hidden"});
        $('#login_bg').css({
            display:'block',
            width:$(window).width(),
            height:$(document).height(),
            zIndex:998
        }).slideDown(300);
    });
    $('#login .close').click(function () {
        $('#login').hide(200);
        $('#login_bg').hide();
        $('body').css({overflow:"scroll"});
    });
    //�û������»��˵�
    $('#user_center').hover(function () {
        $('ul.sub').slideDown(600);
    },function () {
        $('ul.sub').slideUp(600);
    });


    //���Ϻúã�����ô���
    now = new Date(),hour = now.getHours();
    if(hour < 6){$('#user_login').append("\u51cc\u6668\u597d\uff01");}
    else if (hour < 9){$('#user_login').append("\u65e9\u4e0a\u597d\uff01");}
    else if (hour < 12){$('#user_login').append("\u4e0a\u5348\u597d\uff01");}
    else if (hour < 14){$('#user_login').append("\u4e2d\u5348\u597d\uff01");}
    else if (hour < 17){$('#user_login').append("\u4e0b\u5348\u597d\uff01");}
    else if (hour < 19){$('#user_login').append("\u508d\u665a\u597d\uff01");}
    else if (hour < 22){$('#user_login').append("\u665a\u4e0a\u597d\uff01");}
    else {$('#user_login').append("\u591c\u91cc\u597d\uff01");}

	//�û���¼ajax��ѯ�û����Ƿ���ڻ���Ϊ��
	$('input[name=username]').blur(function(){
		$.ajax({
			type:'GET',
			url:getRootpath()+'/LoginUser.Tao',
			dataType:'html',
			data:'username='+encodeURI(encodeURI($(this).val())),
			beforeSend:function(XMLHttpRequest)
			{
				$('#Ajax_Name').html('<img src="'+getRootpath()+'/images/loading.gif">');
				//Pause(this,100000);
			},
			success:function (response,status,xhr) {
				$('#Ajax_Name').html(response);
			}
		});
	//alert($(this).val());
	});

    //�Զ���ȡ�û�������
	if ($.cookie('MNBUser') == 'true') {
		if(MnbU!='' || MnbP!='' || MnbU.length>0 || MnbP.length>0){
			//$('input[name=ck_MNBUser]').attr('checked', true);
			//�Զ���¼�����ٴ�ѡ��checkbox�����ѡ���ˣ���ôÿ�ε�¼�����ӳ�7��ʱ�䣬����û������¼����ô���cookie��һֱ������ȥ
			var MnbU=$.cookie('__MNB_mz');
			var MnbP=base64decode(base64decode(base64decode($.cookie('__MNB'))));
			$('input[name=username]').val(MnbU);
			$('input[name=password]').val(MnbP);
			//�ж�cookieֵ�Ƿ�Ϊ�գ�����li.login_windows���ڲ�ִ��ģ�����¼�
			if($('li').hasClass('login_windows')){
				$('input[name=Login_submit]').trigger("click");
			}
		}
    }
	
	
	$('input[name=Login_submit]').click(function(){
		SaveCookie();
	});
});


    //����������Ч��
    var setSlip = function(){
    var slip = $('#navslip');
    var a = $('.nav li a:first');
        //��ʼ������
        slip.css({
            'width':a.width()+10,
            'left' :parseInt(a.position().left) + 5 +'px',
            'display':'none'
        });
        $('.nav li a').mouseenter(function(){
            //��ʾ����
            if(slip.css('display') == 'none'){
                slip.show();
            };
            //�ƶ�����
            slip.stop().animate({
                width: $(this).width()+10,
                left:  parseInt($(this).position().left) + 5 +'px'
            },300);
        });
    };
    //�õ�Ƭ
    if($('div').hasClass('module')) {
        var slideshow = $('#Slideshow').glide({
            type: 'slideshow',
            startAt: 2
        });
    }
	//JQ��õ�ǰĿ¼
	function getRootpath(){
        var strFullPath=window.document.location.href; 
        var strPath=window.document.location.pathname; 
        var pos=strFullPath.indexOf(strPath); 
        var prePath=strFullPath.substring(0,pos); 
        var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1); 
        return(prePath+postPath); 
    }
    //cookie��ס�û�������
    function SaveCookie() {	
        if ($('input[name=ck_MNBUser]').is(':checked')) {
          var str_name = $('input[name=username]').val();
          var str_pswd = $('input[name=password]').val();
          $.cookie('MNBUser', 'true', { expires: 7 }); //�洢һ����7�����޵�cookie
          $.cookie('__MNB_mz', str_name, { expires: 7 });
          $.cookie('__MNB', base64encode(base64encode(base64encode(str_pswd))), { expires: 7 });
        }
        else {
          $.cookie('MNBUser', 'false', { expire: -1 });
          $.cookie('__MNB_mz', '', { expires: -1 });
          $.cookie('__MNB', '', { expires: -1 });
        }
    }