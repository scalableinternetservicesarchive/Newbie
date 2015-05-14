// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

function resizeImg(id, width)
{
    var img = document.getElementById(id)
    img.style.marginLeft = (width-img.width)/2+"px";
}

pagenum = 0;
count = 0;
var ready = function()
{
    pagenum = 1;
    posts = document.getElementsByName("post");
    count = posts.length
    console.log(count);
    newer = document.getElementById("newer");
    older = document.getElementById("older");
    if (count > 0 && count <= 5) {
        newer.className = "previous disabled";
        older.className = "next disabled";
        return;
    }
    else if (count > 5) {
        for (var i = 5; i < count; i++)
            posts[i].style.display = "none";
        newer.className = "previous disabled";
        older.className = "next";
    }
    else {
        newer.className = "previous disabled";
        older.className = "next disabled";
    }
}

function nextPage()
{
    if (pagenum*5 >= count) {
        older.className = "next disabled";
        return;
    }
    for (var i = (pagenum-1)*5; i < pagenum*5; i++)
        posts[i].style.display = "none";
    pagenum++;
    for (var i = (pagenum-1)*5; i < pagenum*5 && i < count; i++)
        posts[i].style.display = "block";
    if (pagenum*5 < count) {
        newer.className = "previous";
        older.className = "next";
    }
    else {
        newer.className = "previous";
        older.className = "next disabled";
    }
        
}

function previousPage()
{
    if (pagenum == 1) {
        newer.className = "previous disabled";
        return;
    }
    for (var i = (pagenum-1)*5; i < pagenum*5 && i < count; i++)
        posts[i].style.display = "none";
    pagenum--;
    for (var i = (pagenum-1)*5; i < pagenum*5; i++)
        posts[i].style.display = "block";
    if (pagenum > 1) {
        newer.className = "previous";
        older.className = "next";
    }
    else {
        newer.className = "previous disabled";
        older.className = "next";
    }
    
}

$(document).ready(ready);
$(document).on('page:load', ready);
