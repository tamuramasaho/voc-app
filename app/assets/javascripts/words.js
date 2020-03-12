$(function() {
    $('.tab li').click(function() {
        //クリックされたタブを調べる
        var index = $('.tab li').index(this);



        //コンテンツ非表示にする
        $('.content tbody').addClass('hide');
        //クリックされたタブと同じ順番のtbodyを表示する
        $('.content tbody').eq(index).removeClass('hide');



        //タブについているselectクラスを消す
        $('.tab li').removeClass('select');
        //クリックされたタブのみselectをつける
        $(this).addClass('select');
    })

})