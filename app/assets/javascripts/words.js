// document.addEventListener('turbolinks:load', function() {
//     document.querySelectorAll('td').forEach(function(td) {
//         td.addEventListener('mouseover', function(e) {
//             e.currentTarget.style.backgroundColor = '#eff';
//         });

//         td.addEventListener('mouseout', function(e) {
//             e.currentTarget.style.backgroundColor = '';
//         });
//     });
// });

function file_selected(file_field){
    var filename = $(file_field)[0].files[0].name;
    $("#filename").val(filename);

    $('a[href^="#"]').click(function () {
        var speed = 500;
        var href= $(this).attr("href");
        var target = $(href == "#" || href == "" ? 'html' : href);
        var position = target.offset().top;
        $("html, body").animate({scrollTop:position}, speed, 'swing');
        return false;
    });
      
}