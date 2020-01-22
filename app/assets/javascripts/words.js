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
}