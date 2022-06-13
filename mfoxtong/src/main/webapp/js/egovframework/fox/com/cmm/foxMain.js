// 하단독바
$('.bottom_link').click(function () {
    if ($(this).hasClass('active')) {
        $(this).removeClass('active');
    } else {
        $('.bottom_link').removeClass('active');
        $(this).addClass('active');
    }
})

// 슬라이드 태그

$('.slide_item').click(function () {
    if ($(this).hasClass('active')) {
	
    } else {
        $(this).addClass('active');
    }
    $(this).addClass('active');
    $('#searchCtgryId').val($(this).find('input').val());
    document.foxBsshInfoDefaultVO.action="/FoxMobileMain.fo";
	document.foxBsshInfoDefaultVO.submit();	
})

// 햄버거 사이드바 
$('.zone_item > span').click(function () {
    if ($(this).hasClass('active')) {
        $(this).removeClass('active');
    } else {
        $('.zone_item > span').removeClass('active');
        $(this).addClass('active');
    }
})


// 검색
function searchClose() {
    $('#search').val('');
    $('#searchMtltyNm').val('');
    $('.del_ico').css('display', 'none');
}

function searchCloseBtn(el) {
	
    if (!($(el).val() == '')) {
        $('.del_ico').css('display', 'block');
    }

}

// 햄버거 사이드바 
function sideOn(el) {
    $(el).addClass('active');
    $('.bg').css('display', 'block');
    $('body').css('overflow', 'hidden');
}

function sideOff(el) {
    var sideOff = $(el).parents('.right_area').find('.side_btn')[0];
    $(sideOff).removeClass('active');
    $('.bg').css('display', 'none');
    $('body').css('overflow', 'unset');
}


// 스와이퍼 슬라이드
var swiper = new Swiper(".main_content .left_area.mySwiper", {
    slidesPerView: 'auto',
    spaceBetween: 10,
});