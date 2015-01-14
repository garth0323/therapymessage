// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require autocomplete-rails
//= require growlyflash
//for autosize
//= require jquery.autosize


/* smooth scrolling for scroll to top */
$('.scroll-top').click(function(){
  $('body,html').animate({scrollTop:0},800);
})
/* smooth scrolling for scroll down */
$('.scroll-down').click(function(){
  $('body,html').animate({scrollTop:$(window).scrollTop()+800},1000);
})

/* highlight the top nav as scrolling occurs */
$('body').scrollspy({ target: '#navbar' })



/*
!function(a,b){function g(b,c){this.$element=a(b),this.settings=a.extend({},f,c),this.init()}var e="floatlabel",f={slideInput:!0,labelStartTop:"20px",labelEndTop:"10px",paddingOffset:"10px",transitionDuration:.3,transitionEasing:"ease-in-out",labelClass:"",typeMatches:/text|password|email|number|search|url/};g.prototype={init:function(){var a=this,c=this.settings,d=c.transitionDuration,e=c.transitionEasing,f=this.$element,g={"-webkit-transition":"all "+d+"s "+e,"-moz-transition":"all "+d+"s "+e,"-o-transition":"all "+d+"s "+e,"-ms-transition":"all "+d+"s "+e,transition:"all "+d+"s "+e};if("INPUT"===f.prop("tagName").toUpperCase()&&c.typeMatches.test(f.attr("type"))){var h=f.attr("id");h||(h=Math.floor(100*Math.random())+1,f.attr("id",h));var i=f.attr("placeholder"),j=f.data("label"),k=f.data("class");k||(k=""),i&&""!==i||(i="You forgot to add placeholder attribute!"),j&&""!==j||(j=i),this.inputPaddingTop=parseFloat(f.css("padding-top"))+parseFloat(c.paddingOffset),f.wrap('<div class="floatlabel-wrapper" style="position:relative"></div>'),f.before('<label for="'+h+'" class="label-floatlabel '+c.labelClass+" "+k+'">'+j+"</label>"),this.$label=f.prev("label"),this.$label.css({position:"absolute",top:c.labelStartTop,left:f.css("padding-left"),display:"none","-moz-opacity":"0","-khtml-opacity":"0","-webkit-opacity":"0",opacity:"0"}),c.slideInput||f.css({"padding-top":this.inputPaddingTop}),f.on("keyup blur change",function(b){a.checkValue(b)}),b.setTimeout(function(){a.$label.css(g),a.$element.css(g)},100),this.checkValue()}},checkValue:function(a){if(a){var b=a.keyCode||a.which;if(9===b)return}var c=this.$element,d=c.data("flout");""!==c.val()&&c.data("flout","1"),""===c.val()&&c.data("flout","0"),"1"===c.data("flout")&&"1"!==d&&this.showLabel(),"0"===c.data("flout")&&"0"!==d&&this.hideLabel()},showLabel:function(){var a=this;a.$label.css({display:"block"}),b.setTimeout(function(){a.$label.css({top:a.settings.labelEndTop,"-moz-opacity":"1","-khtml-opacity":"1","-webkit-opacity":"1",opacity:"1"}),a.settings.slideInput&&a.$element.css({"padding-top":a.inputPaddingTop}),a.$element.addClass("active-floatlabel")},50)},hideLabel:function(){var a=this;a.$label.css({top:a.settings.labelStartTop,"-moz-opacity":"0","-khtml-opacity":"0","-webkit-opacity":"0",opacity:"0"}),a.settings.slideInput&&a.$element.css({"padding-top":parseFloat(a.inputPaddingTop)-parseFloat(this.settings.paddingOffset)}),a.$element.removeClass("active-floatlabel"),b.setTimeout(function(){a.$label.css({display:"none"})},1e3*a.settings.transitionDuration)}},a.fn[e]=function(b){return this.each(function(){a.data(this,"plugin_"+e)||a.data(this,"plugin_"+e,new g(this,b))})}}(jQuery,window,document);


$(document).ready(function(){
    $('.form-control').floatlabel({
        labelClass: 'float-label',
        labelEndTop: 5
    });
});
*/
/* limit flash duration */
// $('document').ready(function() {
//   setTimeout(function() {
//     $('.alert').slideUp();
//   }, 3000);
// });

$(document).ready(function(){
    $('textarea').autosize();    
});
